import 'package:drift/drift.dart';
import 'package:mdklift/data/database/app_database.dart';
import 'package:mdklift/data/database/dao/active_events_dao.dart';
import 'package:mdklift/data/database/elevators_table.dart';
import 'package:mdklift/data/database/objects_table.dart';
import 'package:mdklift/data/database/service_info_table.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';
import 'package:mdklift/domain/entities/elevator_service_info.dart';

part 'elevators_dao.g.dart';

@DriftAccessor(tables: [ElevatorsTable, ObjectsTable, ServiceInfoTable])
class ElevatorsDao extends DatabaseAccessor<AppDatabase>
    with _$ElevatorsDaoMixin {
  late final ActiveEventsDao activeEventsDao;

  ElevatorsDao(super.db) {
    activeEventsDao = ActiveEventsDao(db);
  }

  Future<List<Elevator>> getElevators() async {
    final query = select(elevatorsTable).join([
      innerJoin(
        objectsTable,
        objectsTable.objectId.equalsExp(elevatorsTable.objectId),
      ),
      innerJoin(
        serviceInfoTable,
        serviceInfoTable.elevatorId.equalsExp(elevatorsTable.elevatorId),
      ),
      //..where(elevatorsTable.isVisible.equals(true))
    ]);

    final rows = await query.get();

    final elevators = <Elevator>[];

    for (final row in rows) {
      final elevator = row.readTable(elevatorsTable);
      final serviceInfo = row.readTable(serviceInfoTable);
      final object = row.readTable(objectsTable);

      final activeEventsDb = await activeEventsDao.getActiveEventsByElevatorId(
        elevator.elevatorId,
      );

      final activeEvents = activeEventsDb.map((event) {
        return ElevatorEvent(
          eventId: event.eventId,
          iconName: event.iconName,
          name: event.eventName,
          priority: event.priority,
          category: event.category,
        );
      }).toList();

      elevators.add(
        Elevator(
          elevatorId: elevator.elevatorId,
          inventoryNumber: elevator.serialNumber,
          type: elevator.purposeType,
          model: elevator.model,
          serviceInfo: ElevatorServiceInfo(
            capacityKg: serviceInfo.carryingCapacityKg,
            maxPeople: serviceInfo.maxPeople,
            address:
                '${object.city}, ул. ${object.street}, д. ${object.houseNumber}'
                '${object.entrance != null ? ', подъезд ${object.entrance}' : ''}',
            commissioningDate: serviceInfo.commissioningDate,
            lastInspectionDate: serviceInfo.lastMaintenanceDate,
            nextInspectionDate: serviceInfo.nextMaintenanceDate,
          ),
          activeEvents: activeEvents,
        ),
      );
    }

    return elevators;
  }

  Future<Elevator?> getElevatorById(int elevatorId) async {
    final elevators = await getElevators();

    try {
      return elevators.firstWhere((e) => e.elevatorId == elevatorId);
    } catch (_) {
      return null;
    }
  }

//   Future<void> upsertFromOkeanBlock(Map<String, dynamic> blockJson) async {
//   final blockId = blockJson['id'] as int;

//   final name = blockJson['name']?.toString() ?? 'Лифт $blockId';
//   final street = blockJson['street']?.toString() ?? '';
//   final house = blockJson['house']?.toString() ?? '';
//   final door = blockJson['door']?.toString();
//   final phone = blockJson['phone']?.toString();
//   final liftInfo = blockJson['liftInfo']?.toString() ?? '';
//   final blockInfo = blockJson['blockInfo']?.toString() ?? '';

//   await transaction(() async {
//     final existingObject = await (select(objectsTable)
//           ..where(
//             (tbl) =>
//                 tbl.street.equals(street) &
//                 tbl.houseNumber.equals(house) &
//                 tbl.entrance.equalsNullable(door),
//           ))
//         .getSingleOrNull();

//     final int objectId;

//     if (existingObject == null) {
//       objectId = await into(objectsTable).insert(
//         ObjectsTableCompanion.insert(
//           city: 'Брянск',
//           street: street,
//           houseNumber: house,
//           entrance: Value(door),
//           contacts: Value(phone),
//         ),
//       );
//     } else {
//       objectId = existingObject.objectId;

//       await (update(objectsTable)
//             ..where((tbl) => tbl.objectId.equals(objectId)))
//           .write(
//         ObjectsTableCompanion(
//           contacts: Value(phone),
//         ),
//       );
//     }

//     await into(elevatorsTable).insertOnConflictUpdate(
//       ElevatorsTableCompanion(
//         elevatorId: Value(blockId),
//         objectId: Value(objectId),
//         serialNumber: Value(name),
//         purposeType: Value(liftInfo.isEmpty ? 'Не определено' : liftInfo),
//         model: Value(blockInfo.isEmpty ? 'Не определено' : blockInfo),
//       ),
//     );

//     final existingServiceInfo = await (select(serviceInfoTable)
//           ..where((tbl) => tbl.elevatorId.equals(blockId)))
//         .getSingleOrNull();

//     if (existingServiceInfo == null) {
//       final now = DateTime.now();

//       await into(serviceInfoTable).insert(
//         ServiceInfoTableCompanion.insert(
//           elevatorId: blockId,
//           carryingCapacityKg: 400,
//           maxPeople: 5,
//           commissioningDate: now,
//           lastMaintenanceDate: now,
//           nextMaintenanceDate: now.add(const Duration(days: 180)),
//         ),
//       );
//     }
//   });
// }

// Future<void> hideNotReceivedElevators(Set<int> receivedIds) async {
//   if (receivedIds.isEmpty) {
//     await update(elevatorsTable).write(
//       const ElevatorsTableCompanion(
//         isVisible: Value(false),
//       ),
//     );
//     return;
//   }

//   await (update(elevatorsTable)
//         ..where((tbl) => tbl.elevatorId.isNotIn(receivedIds.toList())))
//       .write(
//     const ElevatorsTableCompanion(
//       isVisible: Value(false),
//     ),
//   );
// }
// }
    }
