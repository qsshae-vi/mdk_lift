import 'package:mdklift/core/utils/notification_service.dart';
import 'package:mdklift/domain/entities/active_elevator_events.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';
import 'package:mdklift/domain/entities/history_elevator_events.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';

class ElevatorEventsSyncService {
  final ActiveElevatorEventsRepository activeRepository;
  final HistoryElevatorEventsRepository historyRepository;
  final NotificationService notificationService;

  ElevatorEventsSyncService({
    required this.activeRepository,
    required this.historyRepository,
    required this.notificationService,
  });


  Future<void> syncElevatorEvents(
    // запись в БД (в таблицы ActiveEvent, HistoryEvents)
    Elevator updatedElevator,
  ) async {
    final List<ActiveElevatorEvents> currentEvents = await activeRepository
        .getActiveEventsByElevatorId(
          updatedElevator.elevatorId,
        ); // Получаем из БД по id бывшие активные события
    final List<ElevatorEvent> newEvents =
        updatedElevator.activeEvents; // Новые активные события

    // получаем id старых и новых событий
    final currentIds = currentEvents.map((e) => e.eventId).toSet();
    final newIds = newEvents.map((e) => e.eventId).toSet();

    // будем сравнивать именно id, тк классы разные
    final List<ElevatorEvent> addedEvents = newEvents
        .where((e) => !currentIds.contains(e.eventId))
        .toList();
    final List<ActiveElevatorEvents> removedEvents = currentEvents
        .where((e) => !newIds.contains(e.eventId))
        .toList();

    // Добавляем новые активные события
    for (final event in addedEvents) {
      final historyDateTime = DateTime.now();

      await activeRepository.upsertActiveEvents(
        ActiveElevatorEvents(
          elevatorId: updatedElevator.elevatorId,
          eventId: event.eventId,
          eventName: event.name,
          iconName: event.iconName,
          priority: event.priority,
          updatedAt: historyDateTime,
          category: event.category,
        ),
      );
      // Добавляем в историю запись о добавлении
      await historyRepository.addHistoryItem(
        HistoryElevatorEvents(
          recordId: null,
          elevatorId: updatedElevator.elevatorId,
          eventId: event.eventId,
          eventName: event.name,
          iconName: event.iconName,
          priority: event.priority,
          dateTime: historyDateTime,
          action: "added",
        ),
      );

    //   await notificationService.showCriticalEventNotification(
    //     elevatorInventoryNumber: updatedElevator.inventoryNumber,
    //     event: event,
    //   );

    //   await notificationService.showCabinCallNotification(
    //     elevatorInventoryNumber: updatedElevator.inventoryNumber,
    //     event: event,
    //   );
  }

    // Удаляем неактивные события
    for (final event in removedEvents) {
      final historyDateTime = DateTime.now();
      
      await activeRepository.deleteActiveEventsByElevatorId(
        event.eventId,
        event.elevatorId,
      );

      await historyRepository.addHistoryItem(
        // Добавляем в историю запись об удалении
        HistoryElevatorEvents(
          recordId: null,
          elevatorId: updatedElevator.elevatorId,
          eventId: event.eventId,
          eventName: event.eventName,
          iconName: event.iconName,
          priority: event.priority,
          dateTime: historyDateTime,
          action: "deleted",
        ),
      );
    }
  }
}
