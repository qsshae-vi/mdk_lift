// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_events_dao.dart';

// ignore_for_file: type=lint
mixin _$HistoryEventsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ObjectsTableTable get objectsTable => attachedDatabase.objectsTable;
  $ElevatorsTableTable get elevatorsTable => attachedDatabase.elevatorsTable;
  $EventCategoriesTableTable get eventCategoriesTable =>
      attachedDatabase.eventCategoriesTable;
  $EventTypesTableTable get eventTypesTable => attachedDatabase.eventTypesTable;
  $EventHistoryTableTable get eventHistoryTable =>
      attachedDatabase.eventHistoryTable;
  HistoryEventsDaoManager get managers => HistoryEventsDaoManager(this);
}

class HistoryEventsDaoManager {
  final _$HistoryEventsDaoMixin _db;
  HistoryEventsDaoManager(this._db);
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
  $$EventHistoryTableTableTableManager get eventHistoryTable =>
      $$EventHistoryTableTableTableManager(
        _db.attachedDatabase,
        _db.eventHistoryTable,
      );
}
