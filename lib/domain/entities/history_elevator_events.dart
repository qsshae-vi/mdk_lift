class HistoryElevatorEvents {
  final int? recordId;
  final int elevatorId;
  final String eventId;
  final String eventName;
  final String iconName;
  final int priority;
  final DateTime dateTime;
  final String action;

  const HistoryElevatorEvents({
    this.recordId,
    required this.elevatorId,
    required this.eventId,
    required this.eventName,
    required this.iconName,
    required this.priority,
    required this.dateTime,
    required this.action,
  });

  String get iconPath => 'assets/icons/lift_event/$iconName.png';
}

/*enum HistoryElevatorEventAction {
  raised, // событие пришло
  cleared, // событие снято
}*/
