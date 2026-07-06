import 'package:drift/drift.dart';
import 'package:mdklift/data/database/elevators_table.dart';
import 'package:mdklift/data/database/user_table.dart';

class UserElevatorsTable extends Table {
  IntColumn get userId => integer().references(UsersTable, #userId)();

  IntColumn get elevatorId =>
      integer().references(ElevatorsTable, #elevatorId)();

  DateTimeColumn get assignedAt => dateTime().nullable()();
  DateTimeColumn get synchronizedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {userId, elevatorId}; // составной первичный ключ для промежуточной таблицы
}
