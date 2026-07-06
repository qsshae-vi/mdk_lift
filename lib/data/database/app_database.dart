import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:mdklift/data/database/dao/active_events_dao.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/data/database/dao/history_events_dao.dart';
import 'package:mdklift/data/database/elevators_table.dart';
import 'package:mdklift/data/database/event_active_table.dart';
import 'package:mdklift/data/database/event_categories_table.dart';
import 'package:mdklift/data/database/event_history_table.dart';
import 'package:mdklift/data/database/event_types_table.dart';
import 'package:mdklift/data/database/objects_table.dart';
import 'package:mdklift/data/database/service_info_table.dart';
import 'package:mdklift/data/database/user_elevator_table.dart';
import 'package:mdklift/data/database/user_table.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'vkrb2.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [
    EventCategoriesTable,
    EventTypesTable,
    UsersTable,
    ObjectsTable,
    ElevatorsTable,
    UserElevatorsTable,
    EventHistoryTable,
    ServiceInfoTable,
    ActiveEventsTable,
  ],
  daos: [HistoryEventsDao, ActiveEventsDao, ElevatorsDao, EventTypesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // класс управляет жизненным циклом схемы БД
    onCreate: (m) async {
      await m
          .createAll(); // CREATE TABLE для всех таблиц при самой первой установке

      // индексы
      await customStatement(
        'CREATE INDEX idx_history_elevator_time '
        'ON event_history_table (elevator_id, received_at);',
      );

      await customStatement(
        'CREATE INDEX idx_history_event_id '
        'ON event_history_table (event_id);',
      );
    },

    beforeOpen: (details) async {
      await customStatement(
        'PRAGMA foreign_keys = ON',
      ); // включение контроля связей внешних ключей

      if (details.wasCreated) {
        // если бд создана первый раз, новая - заполняем
        await seedReferenceData(); // заполняем справочники
        await seedDemoObjectsAndElevators(); // заполняем объекты, лифты, сервисную информацию
      }
    },
  );

  Future<void> seedReferenceData() async {
    await transaction(() async {
      // вставляем категорию и возвращаем id
      final infoId = await _insertCategory('Информация'); // message_type = 0
      final faultId = await _insertCategory(
        'Неисправность',
      ); // message_type = 1
      final offId = await _insertCategory('Отключение'); // message_type = 2
      final alarmId = await _insertCategory('Авария'); // message_type = 3

      await batch((batch) {
        batch.insertAll(eventTypesTable, [
          _event('106', 'Норма, двери закрыты', 'LiftClose', 0, infoId),

          _event('54', 'Есть Вызов из Кабины', 'Bell', 7, alarmId),
          _event('100', 'Перевозка Пожарных Подразделений', 'Water', 6, infoId),
          _event('2E', 'Нет Замыкания Пожарного дат.', 'Fire', 6, alarmId),
          _event('56', 'Есть Проникновение в МП', 'MP', 5, alarmId),
          _event('01', 'Кнопка Стоп в Каб.', 'Stop', 4, alarmId),
          _event('3B', 'Есть Режим Ревизия', 'R', 4, alarmId),

          _event('E1', 'О1 Авария по фазам ГП', 'O1', 4, offId),
          _event('E2', 'О2 Авария по фазам ПД', 'O2', 4, offId),
          _event('E3', 'О3 Аварийная блокировка', 'O3', 4, offId),
          _event(
            'E4',
            'О4 Авария по отсутствию напряжения в цепи управления (питания)',
            'O4',
            4,
            offId,
          ),
          _event('E5', 'О5 Авария по проникновению в шахту', 'O5', 4, offId),
          _event(
            'E6',
            'О6 Авария по противофазному состоянию ДК ДШ УБ',
            'O6',
            4,
            offId,
          ),
          _event('E7', 'О7 Авария привода дверей', 'O7', 4, offId),
          _event('E8', 'О8 Авария при движении', 'O8', 4, offId),
          _event('E9', 'О9 Авария ГП по УКСЛ', 'O9', 4, offId),
          _event('EA', 'OX Авария Дополнительная', 'OX', 4, offId),

          _event('EB', 'Н1 Авария по фазам ГП', 'H1', 3, faultId),
          _event('ED', 'Н3 Аварийная блокировка', 'H3', 3, faultId),
          _event(
            'EE',
            'Н4 Авария по отсутствию напряжения в цепи управления (питания)',
            'H4',
            3,
            faultId,
          ),
          _event(
            'EF',
            'Н5 Авария по срабатыванию цепи Безопасности. Авария по проникновению в шахту',
            'H5',
            3,
            faultId,
          ),
          _event(
            'F0',
            'Н6 Авария по противофазному состоянию ДК ДШ УБ',
            'H6',
            3,
            faultId,
          ),
          _event('F1', 'Н7 Авария привода дверей', 'H7', 3, faultId),
          _event('F2', 'Н8 Авария при движении', 'H8', 3, faultId),
          _event('F3', 'Н9 Авария ГП по УКСЛ', 'H9', 3, faultId),
          _event('F4', 'НХ Авария Дополнительная', 'HX', 3, faultId),

          _event('77', 'Есть Движение', 'Move', 2, infoId),
          _event('6C', 'Есть Пассажир', 'Men', 1, infoId),
          _event('101', 'Пересброс питания', 'OP', 4, infoId),
          _event('33', 'Приказы в СУЛ. ЭТАЖ 24-17', 'Speak', 0, infoId),
        ]);
      });
    });
  }

  Future<int> _insertCategory(String name) {
    // возвращает id
    return into(
      eventCategoriesTable,
    ).insert(EventCategoriesTableCompanion.insert(name: name));
  }

  EventTypesTableCompanion _event(
    String eventId,
    String eventName,
    String iconName,
    int priority,
    int categoryId,
  ) {
    return EventTypesTableCompanion.insert(
      eventId: eventId,
      eventName: eventName,
      iconName: iconName,
      priority: priority,
      categoryId: categoryId,
    );
  }

  Future<void> seedDemoObjectsAndElevators() async {
    final object1Id = await into(objectsTable).insert(
      ObjectsTableCompanion.insert(
        city: 'Брянск', // для nullable-полей такой синтаксис
        street: 'Дружбы',
        houseNumber: '5',
        entrance: const Value('1'),
      ),
    );

    final object2Id = await into(objectsTable).insert(
      ObjectsTableCompanion.insert(
        city: 'Брянск', // для nullable-полей такой синтаксис
        street: 'Ст. Димитрова',
        houseNumber: '57 "А"',
        entrance: const Value('1'),
      ),
    );

    final object3Id = await into(objectsTable).insert(
      ObjectsTableCompanion.insert(
        city: 'Брянск', // для nullable-полей такой синтаксис
        street: 'Спартаковская',
        houseNumber: '126 "Б"',
        entrance: const Value('1'),
      ),
    );

    final object4Id = await into(objectsTable).insert(
      ObjectsTableCompanion.insert(
        city: 'Брянск', // для nullable-полей такой синтаксис
        street: 'Советская',
        houseNumber: '52',
        entrance: const Value('1'),
      ),
    );

    final object5Id = await into(objectsTable).insert(
      ObjectsTableCompanion.insert(
        city: 'Брянск', // для nullable-полей такой синтаксис
        street: 'Дуки',
        houseNumber: '47/1',
        entrance: const Value('1'),
      ),
    );

    final elevator1Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object1Id,
        serialNumber: 'ORION-43749884-001',
        purposeType: 'Пассажирский',
        model: 'ORION',
      ),
    );

    final elevator2Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object2Id,
        serialNumber: 'ORION-43749884-002',
        purposeType: 'Пассажирский',
        model: 'ORION',
      ),
    );

    final elevator3Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object3Id,
        serialNumber: 'ORION-43749884-003',
        purposeType: 'Грузо-пассажирский',
        model: 'ORION',
      ),
    );

    final elevator4Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object4Id,
        serialNumber: 'ORION-0C7E4736-004',
        purposeType: 'Грузовой',
        model: 'ORION',
      ),
    );

    final elevator5Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object5Id,
        serialNumber: 'LD-36456-1234',
        purposeType: 'Грузовой',
        model: 'SODIMAS VM Speed',
      ),
    );

    final elevator6Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object1Id,
        serialNumber: 'BR-001',
        purposeType: 'Пассажирский',
        model: 'OTIS Gen2',
      ),
    );

    final elevator7Id = await into(elevatorsTable).insert(
      ElevatorsTableCompanion.insert(
        objectId: object5Id,
        serialNumber: 'BR-007',
        purposeType: 'Пассажирский',
        model: "KONE MonoSpace",
      ),
    );

    await batch((batch) {
      batch.insertAll(serviceInfoTable, [
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator1Id),
          carryingCapacityKg: 400,
          maxPeople: 5,
          commissioningDate: DateTime(2014, 6, 12),
          lastMaintenanceDate: DateTime(2025, 12, 15),
          nextMaintenanceDate: DateTime(2026, 6, 15),
        ),
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator2Id),
          carryingCapacityKg: 630,
          maxPeople: 8,
          commissioningDate: DateTime(2016, 9, 4),
          lastMaintenanceDate: DateTime(2026, 1, 10),
          nextMaintenanceDate: DateTime(2026, 7, 10),
        ),
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator3Id),
          carryingCapacityKg: 400,
          maxPeople: 5,
          commissioningDate: DateTime(2018, 3, 21),
          lastMaintenanceDate: DateTime(2026, 2, 5),
          nextMaintenanceDate: DateTime(2026, 8, 5),
        ),
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator4Id),
          carryingCapacityKg: 1000,
          maxPeople: 13,
          commissioningDate: DateTime(2019, 11, 18),
          lastMaintenanceDate: DateTime(2026, 3, 12),
          nextMaintenanceDate: DateTime(2026, 9, 12),
        ),
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator5Id),
          carryingCapacityKg: 630,
          maxPeople: 8,
          commissioningDate: DateTime(2020, 7, 30),
          lastMaintenanceDate: DateTime(2026, 4, 20),
          nextMaintenanceDate: DateTime(2026, 10, 20),
        ),
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator6Id),
          carryingCapacityKg: 400,
          maxPeople: 5,
          commissioningDate: DateTime(2021, 5, 14),
          lastMaintenanceDate: DateTime(2026, 5, 11),
          nextMaintenanceDate: DateTime(2026, 11, 11),
        ),
        ServiceInfoTableCompanion.insert(
          elevatorId: Value(elevator7Id),
          carryingCapacityKg: 630,
          maxPeople: 8,
          commissioningDate: DateTime(2023, 3, 18),
          lastMaintenanceDate: DateTime(2026, 6, 3),
          nextMaintenanceDate: DateTime(2026, 12, 3),
        ),
      ]);
    });
  }
}
