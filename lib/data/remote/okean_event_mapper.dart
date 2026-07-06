import 'package:flutter/foundation.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/data/remote/dto/okean_event_dto.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';

class OkeanEventMapper {
  final EventTypesDao eventTypesDao;

  OkeanEventMapper(this.eventTypesDao);

  Future<ElevatorEvent> map(OkeanEventDto dto) async {
    final eventId = dto.code.toRadixString(16).toUpperCase().padLeft(2, '0');

    debugPrint('API code=${dto.code} -> eventId=$eventId');

    final event = await eventTypesDao.getEventById(eventId);

    if (event == null) {
      debugPrint('НЕ НАЙДЕНО событие в БД: $eventId');

      return ElevatorEvent(
        eventId: eventId,
        name: 'Неизвестное событие',
        priority: 0,
        category: 'Неизвестно',
        iconName: 'unknown',
      );
    }

    return event;
  }
}



