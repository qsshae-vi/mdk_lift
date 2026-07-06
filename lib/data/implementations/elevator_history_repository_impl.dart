import 'package:mdklift/data/database/dao/history_events_dao.dart';
import 'package:mdklift/domain/entities/history_elevator_events.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';

class ElevatorHistoryRepositoryImpl implements HistoryElevatorEventsRepository {
  final HistoryEventsDao historyEventsDao;

  ElevatorHistoryRepositoryImpl(this.historyEventsDao);

  @override
  Future<void> addHistoryItem(HistoryElevatorEvents item) {
    return historyEventsDao.insertHistoryItem(
      elevatorId: item.elevatorId,
      eventId: item.eventId,
      dateTime: item.dateTime,
      action: item.action,
    );
  }

  @override
  Future<List<HistoryElevatorEvents>> getEventsHistoryByElevatorId(
    int elevatorId,
  ) {
    return historyEventsDao.getHistoryByElevatorId(elevatorId);
  }

  @override
  Stream<List<HistoryElevatorEvents>> watchHistoryEventsByElevatorId(
    int elevatorId,
  ) {
    return historyEventsDao.watchHistoryByElevatorId(elevatorId);
  }

  @override
  Stream<List<HistoryElevatorEvents>> watchHistoryEventsByEventId(
    String eventId,
  ) {
    return historyEventsDao.watchHistoryByEventId(eventId);
  }
}
