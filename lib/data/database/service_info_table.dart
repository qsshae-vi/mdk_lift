import 'package:drift/drift.dart';
import 'package:mdklift/data/database/elevators_table.dart';

class ServiceInfoTable extends Table {
  IntColumn get elevatorId =>
      integer().references(ElevatorsTable, #elevatorId)();

  IntColumn get carryingCapacityKg =>
      integer().customConstraint('NOT NULL CHECK(carrying_capacity_kg > 0)')();

  IntColumn get maxPeople =>
      integer().customConstraint('NOT NULL CHECK(max_people > 0)')();

  DateTimeColumn get commissioningDate => dateTime()();

  DateTimeColumn get lastMaintenanceDate => dateTime()();

  DateTimeColumn get nextMaintenanceDate => dateTime().customConstraint(
    'NOT NULL CHECK(next_maintenance_date >= last_maintenance_date)',
  )();

  @override
  Set<Column<Object>> get primaryKey => {elevatorId};
}
