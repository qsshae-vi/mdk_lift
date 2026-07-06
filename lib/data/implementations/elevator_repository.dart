import 'package:mdklift/data/database/dao/active_events_dao.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/repositories/elevator_repository.dart';

class ElevatorRepositoryImpl implements ElevatorRepository {
  final ElevatorsDao elevatorsDao;
  final ActiveEventsDao activeEventsDao;

  ElevatorRepositoryImpl(this.elevatorsDao, this.activeEventsDao);

  @override
  Future<List<Elevator>> getElevators() {
    return elevatorsDao.getElevators();
  }

  // когда меняются активные события - подразумевается обновление списка лифтов UI
  @override
  Stream<List<Elevator>> watchElevators() {
    return activeEventsDao.watchAllActiveEvents().asyncMap((_) {
      // для каждого из элементов исходного потока применяет асинхронную функцию и возвращает новый поток
      return getElevators();
    });
  }
}


