import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/date_time_utils.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/entities/history_elevator_events.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class ElevatorEventsHistoryScreen extends StatefulWidget {
  final Elevator elevator;
  final HistoryElevatorEventsRepository historyRepository;

  const ElevatorEventsHistoryScreen({
    super.key,
    required this.elevator,
    required this.historyRepository,
  });

  @override
  State<ElevatorEventsHistoryScreen> createState() =>
      _ElevatorEventsHistoryScreenState();
}

class _ElevatorEventsHistoryScreenState
    extends State<ElevatorEventsHistoryScreen> {
  final ScrollController _scrollController =
      ScrollController(); // для прокрутки списка вверх

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.lightBlue),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Лифт ${widget.elevator.type}",
              style: const TextStyle(fontSize: 17, color: AppColors.lightBlue),
            ),
            Text(
              widget.elevator.inventoryNumber,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'up',
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
              );
            },
            backgroundColor: AppColors.lightBlue,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              color: Colors.black,
              size: 28,
            ),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'down',
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
              );
            },
            backgroundColor: AppColors.lightBlue,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,

      body: Stack(
        children: [
          StreamBuilder<List<HistoryElevatorEvents>>(
            stream: widget.historyRepository.watchHistoryEventsByElevatorId(
              widget.elevator.elevatorId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.lightBlue),
                );
              }

              final elevatorHistoryEventsList = snapshot.data!;
              final periods = buildPeriods(elevatorHistoryEventsList);

              return ListView.builder(
                controller: _scrollController,
                itemCount: periods.length,
                itemBuilder: (context, index) {
                  final event = periods[index];
                  final period = periods[index];

                  return ListTile(
                    leading: Image.asset(event.iconPath, width: 37, height: 37),
                    title: Text(event.eventName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Начало: ${formatDateTime(period.startedAt)}'),
                        Text(
                          period.endedAt == null
                              ? 'Конец: активно'
                              : 'Конец: ${formatDateTime(period.endedAt!)}',
                        ),
                        Text('Приоритет: ${event.priority}'),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          IgnorePointer(
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.backgroundColor,
                    AppColors.backgroundColor.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventPeriod {
  final int elevatorId;
  final String eventId;
  final String eventName;
  final String iconName;
  final int priority;
  final DateTime startedAt;
  final DateTime? endedAt;

  EventPeriod({
    required this.elevatorId,
    required this.eventId,
    required this.eventName,
    required this.iconName,
    required this.priority,
    required this.startedAt,
    required this.endedAt,
  });

  String get iconPath => 'assets/icons/lift_event/$iconName.png';
}

List<EventPeriod> buildPeriods(List<HistoryElevatorEvents> items) {
  final sorted = [...items]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  final opened = <String, HistoryElevatorEvents>{};
  final periods = <EventPeriod>[];

  for (final item in sorted) {
    final key = '${item.elevatorId}_${item.eventId}';

    if (item.action == 'added') {
      opened.putIfAbsent(key, () => item);
    }

    if (item.action == 'deleted') {
      final started = opened.remove(key);

      if (started != null) {
        periods.add(
          EventPeriod(
            elevatorId: started.elevatorId,
            eventId: started.eventId,
            eventName: started.eventName,
            iconName: started.iconName,
            priority: started.priority,
            startedAt: started.dateTime,
            endedAt: item.dateTime,
          ),
        );
      }
    }
  }

  for (final started in opened.values) {
    periods.add(
      EventPeriod(
        elevatorId: started.elevatorId,
        eventId: started.eventId,
        eventName: started.eventName,
        iconName: started.iconName,
        priority: started.priority,
        startedAt: started.dateTime,
        endedAt: null,
      ),
    );
  }

  periods.sort((a, b) {
    final aDate = a.endedAt ?? a.startedAt;
    final bDate = b.endedAt ?? b.startedAt;
    return bDate.compareTo(aDate);
  });

  return periods;
}
