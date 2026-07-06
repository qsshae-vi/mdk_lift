import 'package:drift/drift.dart';

class ObjectsTable extends Table {
  IntColumn get objectId => integer().autoIncrement()();
  TextColumn get city => text()();
  TextColumn get street => text()();
  TextColumn get houseNumber => text()();

  /// Не у всех объектов есть подъезд
  TextColumn get entrance => text().nullable()();

  /// Контакты опциональны
  TextColumn get contacts => text().nullable()();
}
