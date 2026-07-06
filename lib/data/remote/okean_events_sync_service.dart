import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/remote/dto/okean_event_dto.dart';
import 'package:mdklift/data/remote/okean_api.dart';
import 'package:mdklift/data/remote/okean_event_mapper.dart';
import 'package:mdklift/domain/elevator_events_sync_service.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';

class OkeanEventsSyncService {
  final OkeanApi api;
  final ElevatorsDao elevatorsDao;
  final OkeanEventMapper eventMapper;
  final ElevatorEventsSyncService syncService;

  Timer? _timer;

  final ValueNotifier<bool> isServerAvailable = ValueNotifier(false);

  bool _isSyncing = false;

  OkeanEventsSyncService({
    required this.api,
    required this.elevatorsDao,
    required this.eventMapper,
    required this.syncService,
  });

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) async {
      await syncAll();
    });
  }

  Future<void> syncAll() async {
    if (_isSyncing) return;

    _isSyncing = true;

    try {
      final status = await api.ping();

      if (status != 200) {
        isServerAvailable.value = false;
        return;
      }

    //  await syncStructure();
      await syncCurrentEvents();

      isServerAvailable.value = true;
    } catch (e) {
      isServerAvailable.value = false;
    } finally {
      _isSyncing = false;
    }
  }

  // Future<void> syncStructure() async {
  //   final rootJson = await api.rootGroup();
  //   final rootId = rootJson['id'] as int;

  //   final receivedIds = <int>{};

  //   await _loadGroupRecursively(rootId, receivedIds);   // обход всех групп от корневой группы

  //   await elevatorsDao.hideNotReceivedElevators(receivedIds);   // скрываем все лифты, которые не вернулись пользователю
  // }

  // Future<void> _loadGroupRecursively(int groupId, Set<int> receivedIds) async {
  //   final blocksJson = await api.blocks(parent: groupId);   // лифты текущей группы

  //   for (final blockJson in blocksJson) {
  //     final blockId = blockJson['id'] as int;

  //     receivedIds.add(blockId);

  //     await elevatorsDao.upsertFromOkeanBlock(blockJson);   // сохранили/обновили в БД
  //   }

  //   final childrenJson = await api.children(parent: groupId);  // получаем дочерние группы (если есть)

  //   for (final childJson in childrenJson) {
  //     final childId = childJson['id'] as int;
  //     await _loadGroupRecursively(childId, receivedIds);
  //   }
  // }

  Future<void> syncCurrentEvents() async {
    final elevators = await elevatorsDao.getElevators();

    for (final elevator in elevators) {
      // для каждого лифта раз в 10 секунд получаем текущие события от сервера
      final rawEvents = await api.events(block: elevator.elevatorId);

      final activeEvents = <ElevatorEvent>[];

      for (final rawEvent in rawEvents) {
        final dto = OkeanEventDto.fromJson(rawEvent); // JSON -> OkeanEvent

        if (!dto.isActive) continue;

        final event = await eventMapper.map(dto); // OkeanEvent -> ElevatorEvent

        activeEvents.add(event); // добавляем в список новых событий для лифта
      }

      final updatedElevator = Elevator(
        elevatorId: elevator.elevatorId,
        inventoryNumber: elevator.inventoryNumber,
        type: elevator.type,
        model: elevator.model,
        serviceInfo: elevator.serviceInfo,
        activeEvents: activeEvents,
      );

      await syncService.syncElevatorEvents(updatedElevator); // обновляем БД
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
