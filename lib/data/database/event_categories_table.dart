import 'package:drift/drift.dart';

class EventCategoriesTable extends Table {
  IntColumn get categoryId => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}
