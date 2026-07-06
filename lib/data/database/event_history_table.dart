import 'package:drift/drift.dart';
import 'package:mdklift/data/database/elevators_table.dart';
import 'package:mdklift/data/database/event_types_table.dart';

class EventHistoryTable extends Table {
  IntColumn get eventHistoryId => integer().autoIncrement()();

  IntColumn get elevatorId =>
      integer().references(ElevatorsTable, #elevatorId)();

  TextColumn get eventId => text().references(EventTypesTable, #eventId)();

  DateTimeColumn get receivedAt => dateTime()();
  TextColumn get action => text()();
}
