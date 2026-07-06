// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_types_dao.dart';

// ignore_for_file: type=lint
mixin _$EventTypesDaoMixin on DatabaseAccessor<AppDatabase> {
  $EventCategoriesTableTable get eventCategoriesTable =>
      attachedDatabase.eventCategoriesTable;
  $EventTypesTableTable get eventTypesTable => attachedDatabase.eventTypesTable;
  EventTypesDaoManager get managers => EventTypesDaoManager(this);
}

class EventTypesDaoManager {
  final _$EventTypesDaoMixin _db;
  EventTypesDaoManager(this._db);
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
}
