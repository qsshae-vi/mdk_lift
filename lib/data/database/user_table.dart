import 'package:drift/drift.dart';

class UsersTable extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get login => text().unique()();
  TextColumn get name => text()();
}
