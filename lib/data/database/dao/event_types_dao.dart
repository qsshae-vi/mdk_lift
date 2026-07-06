import 'package:drift/drift.dart';
import 'package:mdklift/data/database/app_database.dart';
import 'package:mdklift/data/database/event_categories_table.dart';
import 'package:mdklift/data/database/event_types_table.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';

part 'event_types_dao.g.dart';

@DriftAccessor(tables: [EventTypesTable, EventCategoriesTable])
class EventTypesDao extends DatabaseAccessor<AppDatabase>
    with _$EventTypesDaoMixin {
  EventTypesDao(super.db);

  Future<List<ElevatorEvent>> getEventTypes() async {
    final query = select(eventTypesTable).join([
      innerJoin(
        eventCategoriesTable,
        eventCategoriesTable.categoryId.equalsExp(eventTypesTable.categoryId),
      ),
    ]);

    final rows = await query.get();

    return rows.map((row) {
      final eventType = row.readTable(eventTypesTable);
      final category = row.readTable(eventCategoriesTable);

      return ElevatorEvent(
        eventId: eventType.eventId,
        iconName: eventType.iconName,
        name: eventType.eventName,
        priority: eventType.priority,
        category: category.name,
      );
    }).toList();
  }

   Future<ElevatorEvent?> getEventById(
    String eventId,
  ) async {
    final query = select(eventTypesTable).join([
      innerJoin(
        eventCategoriesTable,
        eventCategoriesTable.categoryId.equalsExp(
          eventTypesTable.categoryId,
        ),
      ),
    ])
      ..where(
        eventTypesTable.eventId.equals(eventId),
      );

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    final eventType = row.readTable(eventTypesTable);
    final category = row.readTable(eventCategoriesTable);

    return ElevatorEvent(
      eventId: eventType.eventId,
      iconName: eventType.iconName,
      name: eventType.eventName,
      priority: eventType.priority,
      category: category.name,
    );
  }
}
