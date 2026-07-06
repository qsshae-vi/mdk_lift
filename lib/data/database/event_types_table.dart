import 'package:drift/drift.dart';
import 'package:mdklift/data/database/event_categories_table.dart';

class EventTypesTable extends Table {
  TextColumn get eventId => text()(); // шестнадцатеричный код
  TextColumn get eventName => text()(); //+.unique()() 
  TextColumn get iconName => text()();

  IntColumn get priority =>
      integer().customConstraint('NOT NULL CHECK(priority >= 0)')();

  IntColumn get categoryId =>
      integer().references(EventCategoriesTable, #categoryId)();

  @override
  Set<Column<Object>> get primaryKey => {eventId};
}