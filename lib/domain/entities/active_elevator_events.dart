class ActiveElevatorEvents {
  final int elevatorId;
  final String eventId;
  final String eventName;
  final String iconName;
  final int priority;
  final DateTime updatedAt;
  final String category;

  ActiveElevatorEvents({
    required this.elevatorId,
    required this.eventId,
    required this.eventName,
    required this.iconName,
    required this.priority,
    required this.updatedAt,
    required this.category,
  });

  String get iconPath => 'assets/icons/lift_event/$iconName.png';
}
