import 'package:mdklift/domain/entities/elevator_event.dart';
import 'package:mdklift/domain/entities/elevator_service_info.dart';

/* enum ElevatorStatus {
  normal(
    label: "Верифицировано",
    color: Colors.green,
    icon: Icons.check_circle,
  ),

  maintenance(label: "Обслуживание", color: Colors.orange, icon: Icons.build),

  emergency(label: "Авария", color: Colors.red, icon: Icons.warning),

  offline(label: "Нет связи", color: Colors.grey, icon: Icons.wifi_off);

  final String label;
  final Color color;
  final IconData icon;

  const ElevatorStatus({
    required this.label,
    required this.color,
    required this.icon,
  });
}
*/

// enum ElevatorType {
//   passenger("Пассажирский"),
//   freight("Грузовой");

//   final String label;

//   const ElevatorType(this.label);
// }

class Elevator {
  final int elevatorId;
  final String inventoryNumber;
  final List<ElevatorEvent> activeEvents;
  final String type;
  final String model;
  final ElevatorServiceInfo serviceInfo;
  // final int currentFloor;
  // final String direction;

  const Elevator({
    required this.elevatorId,
    required this.inventoryNumber,
    required this.type,
    required this.model,
    required this.serviceInfo,
    required this.activeEvents,
    // required this.currentFloor,
    //required this.direction,
  });

  ElevatorEvent? get priorityEvent {
    if (activeEvents.isEmpty) return null;

    ElevatorEvent top = activeEvents.first;

    for (final event in activeEvents.skip(1)) {
      if (event.priority > top.priority) {
        top = event;
      }
    }

    return top;
  }

  String get displayEventName => priorityEvent?.name ?? 'Норма';

  String get displayEventIconPath =>
      priorityEvent?.iconPath ?? 'assets/icons/lift_event/LiftClose.png';

  int get activeEventsCount => activeEvents.length;

  bool get hasEvents => activeEvents.isNotEmpty;

  List<ElevatorEvent> get sortedEvents {
    // геттер
    final list = [...activeEvents]; // копия списка
    list.sort(
      (a, b) => b.priority.compareTo(a.priority),
    ); // от более приоритетного
    return list;
  }

  // copyWith, fromJson, toJson
}
