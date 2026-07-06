import 'package:mdklift/domain/entities/active_elevator_events.dart';

abstract class ActiveElevatorEventsRepository {
  Future<List<ActiveElevatorEvents>> getActiveEventsByElevatorId(int elevatorId);
  Future<void> upsertActiveEvents(ActiveElevatorEvents event);
  Future<void> deleteActiveEventsByElevatorId(String eventId, int elevatorId);
  Stream<List<ActiveElevatorEvents>> watchActiveEventsByElevatorId(int elevatorId);
  Future<void> clearAll();
}
