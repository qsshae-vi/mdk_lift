import 'dart:async';
import 'dart:math';

import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/data/remote/okean_api.dart';

class MockOkeanApiServer implements OkeanApi {
  final EventTypesDao eventTypesDao;
  final ElevatorsDao elevatorsDao;

  final _random = Random();

  final Map<int, List<Map<String, dynamic>>> _eventsByBlock = {};

  Timer? _timer;

  MockOkeanApiServer(
    this.elevatorsDao,
    this.eventTypesDao,
  );

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 15), (_) async {
      await _generateRandomEvents();  // Каждые 15 секунд генерируются события
    });
  }

  Future<int> ping() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 200;
  }

  Future<List<Map<String, dynamic>>> events({
    required int block,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return _eventsByBlock[block] ?? [];
  }

  Future<void> _generateRandomEvents() async {
    final elevators = await elevatorsDao.getElevators();

    if (elevators.isEmpty) return;

    final elevator = elevators[_random.nextInt(elevators.length)];
    final blockId = elevator.elevatorId;

    final hasEvents = _random.nextBool();

    if (!hasEvents) {
      _eventsByBlock[blockId] = [];
      return;
    }

    final allEvents = await eventTypesDao.getEventTypes();

    final shuffled = [...allEvents]..shuffle(_random);

    final count = _random.nextInt(3) + 1;

    _eventsByBlock[blockId] = shuffled.take(count).map((event) {
      return {
        'code': int.parse(event.eventId, radix: 16),
        'start': DateTime.now().toIso8601String(),
        'end': null,
      };
    }).toList();
  }

  void dispose() {
    _timer?.cancel();
  }
}