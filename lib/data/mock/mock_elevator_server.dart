import 'dart:async';
import 'dart:math';

import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';
// import 'package:vkrb/core/exceptions/server_exception.dart';
import 'package:mdklift/domain/elevator_events_sync_service.dart';

class MockElevatorServer {
  final ElevatorsDao elevatorsDao;
  final EventTypesDao eventTypesDao;
  final ElevatorEventsSyncService syncService;

  final _controller = StreamController<List<Elevator>>.broadcast();
  final _random = Random();

  Timer? _timer;

  MockElevatorServer(this.elevatorsDao, this.syncService, this.eventTypesDao);

  Future<List<Elevator>> fetchElevators() async {
    // Аналог GET /elevators
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // небольшая задержка, имитация загрузки подключения к серверу
    return elevatorsDao.getElevators();
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 15), (_) async {
      // раз в 15 секунд обновляются события на лифте
      await _changeRandomElevator();

      final elevators = await fetchElevators();
      _controller.add(elevators);
    });
  }

  // Аналог WebSocket stream
  Stream<List<Elevator>> get elevatorsStream async* {
    // текущее состояние и все последующие обновления
    yield await fetchElevators();
    yield* _controller.stream;

    //throw ServerException('Сервер недоступен');  ----- для отладки ошибок
  }

  Future<void> _changeRandomElevator() async {
    final elevators = await elevatorsDao.getElevators();

    if (elevators.isEmpty) return;

    final index = _random.nextInt(elevators.length);
    final oldElevator =
        elevators[index]; // выбираем рандомный лифт из списка для изменения

    final bool shouldBeNormal = _random.nextBool();

    final List<ElevatorEvent> newEvents;

    if (shouldBeNormal) {
      newEvents = [];
    } else {
      final allEvents = await eventTypesDao.getEventTypes();

      final shuffled = [...allEvents]..shuffle(_random);

      final count = _random.nextInt(3) + 1; // 1..3 события
      newEvents = shuffled.take(count).toList();
    }
    final updatedElevator = Elevator(
      // по сути copy
      elevatorId: oldElevator.elevatorId,
      inventoryNumber: oldElevator.inventoryNumber,
      type: oldElevator.type,
      model: oldElevator.model,
      serviceInfo: oldElevator.serviceInfo,
      activeEvents: newEvents,
    );

    // _elevators[index] =
    //     updatedElevator; // обновляем лифт, передав новый(ые) ивент(ы)

    await syncService.syncElevatorEvents(updatedElevator);
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
