import 'package:mdklift/domain/entities/history_elevator_events.dart';

abstract class HistoryElevatorEventsRepository {
  Future<List<HistoryElevatorEvents>> getEventsHistoryByElevatorId(
    int elevatorId,
  );
  Future<void> addHistoryItem(HistoryElevatorEvents item);
  Stream<List<HistoryElevatorEvents>> watchHistoryEventsByElevatorId(
    int elevatorId,
  );
  Stream<List<HistoryElevatorEvents>> watchHistoryEventsByEventId(
    String eventId,
  );
}
