// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elevators_dao.dart';

// ignore_for_file: type=lint
mixin _$ElevatorsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ObjectsTableTable get objectsTable => attachedDatabase.objectsTable;
  $ElevatorsTableTable get elevatorsTable => attachedDatabase.elevatorsTable;
  $ServiceInfoTableTable get serviceInfoTable =>
      attachedDatabase.serviceInfoTable;
  ElevatorsDaoManager get managers => ElevatorsDaoManager(this);
}

class ElevatorsDaoManager {
  final _$ElevatorsDaoMixin _db;
  ElevatorsDaoManager(this._db);
  $$ObjectsTableTableTableManager get objectsTable =>
      $$ObjectsTableTableTableManager(_db.attachedDatabase, _db.objectsTable);
  $$ElevatorsTableTableTableManager get elevatorsTable =>
      $$ElevatorsTableTableTableManager(
        _db.attachedDatabase,
        _db.elevatorsTable,
      );
  $$ServiceInfoTableTableTableManager get serviceInfoTable =>
      $$ServiceInfoTableTableTableManager(
        _db.attachedDatabase,
        _db.serviceInfoTable,
      );
}
