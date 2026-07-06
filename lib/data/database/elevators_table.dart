import 'package:drift/drift.dart';
import 'package:mdklift/data/database/objects_table.dart';

class ElevatorsTable extends Table {
  IntColumn get elevatorId => integer().autoIncrement()();

  IntColumn get objectId =>
      integer().references(ObjectsTable, #objectId)();

  TextColumn get serialNumber => text().unique()(); // альтернативный первичный ключ
  TextColumn get purposeType => text()();
  TextColumn get model => text()();
 // TextColumn get currentState => text()();
  // АНАЛОГ ТЕКУЩИХ СОБЫТИЙ??

  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();
}