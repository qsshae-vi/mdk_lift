import 'package:drift/drift.dart';
import 'package:mdklift/data/database/app_database.dart';
import 'package:mdklift/data/database/elevators_table.dart';
import 'package:mdklift/data/database/event_history_table.dart';
import 'package:mdklift/data/database/event_types_table.dart';
import 'package:mdklift/domain/entities/history_elevator_events.dart';

part 'history_events_dao.g.dart';

@DriftAccessor(tables: [EventHistoryTable, EventTypesTable, ElevatorsTable])
class HistoryEventsDao extends DatabaseAccessor<AppDatabase>
    with _$HistoryEventsDaoMixin {
  HistoryEventsDao(AppDatabase db) : super(db);

  Future<void> insertHistoryItem({
    required int elevatorId,
    required String eventId,
    required DateTime dateTime,
    required String action,
  }) {
    return into(eventHistoryTable).insert(
      EventHistoryTableCompanion.insert(
        elevatorId: elevatorId,
        eventId: eventId,
        receivedAt: dateTime,
        action: action,
      ),
    );
  }

  Future<List<HistoryElevatorEvents>> getHistoryByElevatorId(
    int elevatorId,
  ) async {
    final query =
        (select(eventHistoryTable)
              ..where((tbl) => tbl.elevatorId.equals(elevatorId))
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.receivedAt)]))
            .join([
              innerJoin(
                eventTypesTable,
                eventTypesTable.eventId.equalsExp(eventHistoryTable.eventId),
              ),
            ]);

    final rows = await query.get();

    return rows.map((row) {
      final history = row.readTable(
        eventHistoryTable,
      ); // только данные, принадлежащие соответствующей таблице
      final eventType = row.readTable(eventTypesTable);

      return HistoryElevatorEvents(
        recordId: history.eventHistoryId,
        elevatorId: history.elevatorId,
        eventId: history.eventId,
        eventName: eventType.eventName,
        iconName: eventType.iconName,
        priority: eventType.priority,
        dateTime: history.receivedAt,
        action: history.action,
      );
    }).toList();
  }

  Stream<List<HistoryElevatorEvents>> watchHistoryByElevatorId(int elevatorId) {
    final query =
        (select(eventHistoryTable)
              ..where((tbl) => tbl.elevatorId.equals(elevatorId))
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.receivedAt)]))
            .join([
              innerJoin(
                eventTypesTable,
                eventTypesTable.eventId.equalsExp(eventHistoryTable.eventId),
              ),
            ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final history = row.readTable(eventHistoryTable);
        final eventType = row.readTable(eventTypesTable);

        return HistoryElevatorEvents(
          recordId: history.eventHistoryId,
          elevatorId: history.elevatorId,
          eventId: history.eventId,
          eventName: eventType.eventName,
          iconName: eventType.iconName,
          priority: eventType.priority,
          dateTime: history.receivedAt,
          action: history.action,
        );
      }).toList();
    });
  }

  Stream<List<HistoryElevatorEvents>> watchHistoryByEventId(String eventId) {
    final query =
        (select(eventHistoryTable)
              ..where((tbl) => tbl.eventId.equals(eventId))
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.receivedAt)]))
            .join([
              innerJoin(
                eventTypesTable,
                eventTypesTable.eventId.equalsExp(eventHistoryTable.eventId),
              ),
            ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final history = row.readTable(eventHistoryTable);
        final eventType = row.readTable(eventTypesTable);

        return HistoryElevatorEvents(
          recordId: history.eventHistoryId,
          elevatorId: history.elevatorId,
          eventId: history.eventId,
          eventName: eventType.eventName,
          iconName: eventType.iconName,
          priority: eventType.priority,
          dateTime: history.receivedAt,
          action: history.action,
        );
      }).toList();
    });
  }
}
