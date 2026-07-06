import 'package:mdklift/domain/mappers/event_elevator_icon_mapper.dart';

class ElevatorEvent {
  final String eventId;
  final String iconName;
  final String name;
  final int priority;
  final String category;

  ElevatorEvent({
    required this.eventId,
    required this.iconName,
    required this.name,
    required this.priority,
    required this.category,
  });

  String get iconPath => EventElevatorIconMapper.path(iconName);

}
