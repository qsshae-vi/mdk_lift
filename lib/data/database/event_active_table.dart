import 'package:drift/drift.dart';

import 'elevators_table.dart';
import 'event_types_table.dart';

class ActiveEventsTable extends Table {
  IntColumn get elevatorId =>
      integer().references(ElevatorsTable, #elevatorId)();

  TextColumn get eventId => text().references(EventTypesTable, #eventId)();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {elevatorId, eventId};
}
