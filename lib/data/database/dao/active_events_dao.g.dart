// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_events_dao.dart';

// ignore_for_file: type=lint
mixin _$ActiveEventsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ObjectsTableTable get objectsTable => attachedDatabase.objectsTable;
  $ElevatorsTableTable get elevatorsTable => attachedDatabase.elevatorsTable;
  $EventCategoriesTableTable get eventCategoriesTable =>
      attachedDatabase.eventCategoriesTable;
  $EventTypesTableTable get eventTypesTable => attachedDatabase.eventTypesTable;
  $ActiveEventsTableTable get activeEventsTable =>
      attachedDatabase.activeEventsTable;
  ActiveEventsDaoManager get managers => ActiveEventsDaoManager(this);
}

class ActiveEventsDaoManager {
  final _$ActiveEventsDaoMixin _db;
  ActiveEventsDaoManager(this._db);
  $$ObjectsTableTableTableManager get objectsTable =>
      $$ObjectsTableTableTableManager(_db.attachedDatabase, _db.objectsTable);
  $$ElevatorsTableTableTableManager get elevatorsTable =>
      $$ElevatorsTableTableTableManager(
        _db.attachedDatabase,
        _db.elevatorsTable,
      );
  $$EventCategoriesTableTableTableManager get eventCategoriesTable =>
      $$EventCategoriesTableTableTableManager(
        _db.attachedDatabase,
        _db.eventCategoriesTable,
      );
  $$EventTypesTableTableTableManager get eventTypesTable =>
      $$EventTypesTableTableTableManager(
        _db.attachedDatabase,
        _db.eventTypesTable,
      );
  $$ActiveEventsTableTableTableManager get activeEventsTable =>
      $$ActiveEventsTableTableTableManager(
        _db.attachedDatabase,
        _db.activeEventsTable,
      );
}
