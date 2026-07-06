import 'package:mdklift/data/database/dao/active_events_dao.dart';
import 'package:mdklift/domain/entities/active_elevator_events.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';

class ElevatorActiveEventsRepositoryImpl
    implements ActiveElevatorEventsRepository {
  final ActiveEventsDao activeEventsDao;

  ElevatorActiveEventsRepositoryImpl(this.activeEventsDao);

  @override
  Future<List<ActiveElevatorEvents>> getActiveEventsByElevatorId(
    int elevatorId,
  ) {
    return activeEventsDao.getActiveEventsByElevatorId(elevatorId);
  }

  @override
  Future<void> upsertActiveEvents(ActiveElevatorEvents event) {
    return activeEventsDao.upsertActiveEvents(
      elevatorId: event.elevatorId,
      eventId: event.eventId,
      updatedAt: event.updatedAt,
    );
  }

  @override
  Future<void> deleteActiveEventsByElevatorId(String eventId, int elevatorId) {
    return activeEventsDao.deleteActiveEvents(
      elevatorId: elevatorId,
      eventId: eventId,
    );
  }

  @override
  Stream<List<ActiveElevatorEvents>> watchActiveEventsByElevatorId(
    int elevatorId,
  ) {
    return activeEventsDao.watchActiveEventsByElevatorId(elevatorId);
  }

  @override
  Future<void> clearAll() {
    return activeEventsDao.clearAll();
  }
}
