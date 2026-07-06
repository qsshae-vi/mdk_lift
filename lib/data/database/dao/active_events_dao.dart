import 'package:drift/drift.dart';
import 'package:mdklift/data/database/app_database.dart';
import 'package:mdklift/data/database/event_active_table.dart';
import 'package:mdklift/data/database/event_categories_table.dart';
import 'package:mdklift/data/database/event_types_table.dart';
import 'package:mdklift/domain/entities/active_elevator_events.dart';

part 'active_events_dao.g.dart';

@DriftAccessor(
  tables: [ActiveEventsTable, EventTypesTable, EventCategoriesTable],
)
class ActiveEventsDao extends DatabaseAccessor<AppDatabase>
    with _$ActiveEventsDaoMixin {
  ActiveEventsDao(super.db);

  Future<void> upsertActiveEvents({
    required int elevatorId,
    required String eventId,
    required DateTime updatedAt,
  }) {
    return into(activeEventsTable).insertOnConflictUpdate(
      ActiveEventsTableCompanion.insert(
        elevatorId: elevatorId,
        eventId: eventId,
        updatedAt: updatedAt,
      ),
    );
  }

  Future<void> deleteActiveEvents({
    required int elevatorId,
    required String eventId,
  }) {
    return (delete(activeEventsTable)..where(
          (tbl) =>
              tbl.elevatorId.equals(elevatorId) & tbl.eventId.equals(eventId),
        ))
        .go();
  }

  Future<void> clearAll() {
    return delete(activeEventsTable).go();
  }

  Future<List<ActiveElevatorEvents>> getActiveEventsByElevatorId(
    int elevatorId,
  ) async {
    final query =
        (select(activeEventsTable)
              ..where((tbl) => tbl.elevatorId.equals(elevatorId))
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
            .join([
              innerJoin(
                eventTypesTable,
                eventTypesTable.eventId.equalsExp(activeEventsTable.eventId),
              ),
              innerJoin(
                eventCategoriesTable,
                eventCategoriesTable.categoryId.equalsExp(
                  eventTypesTable.categoryId,
                ),
              ),
            ]);

    final rows = await query.get();

    return rows.map((row) {
      final active = row.readTable(activeEventsTable);
      final type = row.readTable(eventTypesTable);
      final category = row.readTable(eventCategoriesTable);

      return ActiveElevatorEvents(
        elevatorId: active.elevatorId,
        eventId: active.eventId,
        eventName: type.eventName,
        iconName: type.iconName,
        priority: type.priority,
        updatedAt: active.updatedAt,
        category: category.name,
      );
    }).toList();
  }

  Stream<List<ActiveElevatorEvents>> watchActiveEventsByElevatorId(
    int elevatorId,
  ) {
    final query =
        (select(
          activeEventsTable,
        )..where((tbl) => tbl.elevatorId.equals(elevatorId))).join([
          innerJoin(
            eventTypesTable,
            eventTypesTable.eventId.equalsExp(activeEventsTable.eventId),
          ),
          innerJoin(
            eventCategoriesTable,
            eventCategoriesTable.categoryId.equalsExp(
              eventTypesTable.categoryId,
            ),
          ),
        ]);

    query.orderBy([
      OrderingTerm.desc(
        eventTypesTable.priority,
      ), // для сортировки по приоритету
      OrderingTerm.desc(activeEventsTable.updatedAt),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final active = row.readTable(activeEventsTable);
        final type = row.readTable(eventTypesTable);
        final category = row.readTable(eventCategoriesTable);

        return ActiveElevatorEvents(
          elevatorId: active.elevatorId,
          eventId: active.eventId,
          eventName: type.eventName,
          iconName: type.iconName,
          priority: type.priority,
          updatedAt: active.updatedAt,
          category: category.name,
        );
      }).toList();
    });
  }

  Stream<List<ActiveElevatorEvents>> watchAllActiveEvents() {
    final query = select(activeEventsTable).join([
      innerJoin(
        eventTypesTable,
        eventTypesTable.eventId.equalsExp(activeEventsTable.eventId),
      ),
      innerJoin(
        eventCategoriesTable,
        eventCategoriesTable.categoryId.equalsExp(eventTypesTable.categoryId),
      ),
    ]);

    query.orderBy([
      OrderingTerm.desc(
        eventTypesTable.priority,
      ), // для сортировки по приоритету
      OrderingTerm.desc(activeEventsTable.updatedAt),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final active = row.readTable(activeEventsTable);
        final type = row.readTable(eventTypesTable);
        final category = row.readTable(eventCategoriesTable);

        return ActiveElevatorEvents(
          elevatorId: active.elevatorId,
          eventId: active.eventId,
          eventName: type.eventName,
          iconName: type.iconName,
          priority: type.priority,
          updatedAt: active.updatedAt,
          category: category.name,
        );
      }).toList();
    });
  }
}
