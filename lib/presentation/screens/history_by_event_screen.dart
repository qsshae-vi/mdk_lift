import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/date_time_utils.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';
import 'package:mdklift/domain/entities/history_elevator_events.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class HistoryByEventScreen extends StatefulWidget {
  final ElevatorEvent event;
  final HistoryElevatorEventsRepository historyRepository;
  final ElevatorsDao elevatorsDao;

  const HistoryByEventScreen({
    super.key,
    required this.event,
    required this.historyRepository,
    required this.elevatorsDao,
  });

  @override
  State<HistoryByEventScreen> createState() => _HistoryByEventScreenState();
}

class _HistoryByEventScreenState extends State<HistoryByEventScreen> {
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
          children: [
            Text(
              widget.event.name,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.lightBlue,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Text(
              "Приоритет: ${widget.event.priority}",
              style: const TextStyle(fontSize: 15, color: AppColors.essanGrey),
            ),
          ],
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(widget.event.iconPath, width: 37, height: 37),
          ),
        ],
      ),

      floatingActionButton: Column(
        // для прокрутки списка вверх и вниз
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
            stream: widget.historyRepository.watchHistoryEventsByEventId(
              widget.event.eventId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.lightBlue),
                );
              }

              final elevatorHistoryEventsList = snapshot.data!;

              return ListView.builder(
                controller: _scrollController,
                itemCount: elevatorHistoryEventsList.length,
                itemBuilder: (context, index) {
                  final event = elevatorHistoryEventsList[index];
                  final int elevatorId = event.elevatorId;

                  return ListTile(
                    // subtitle: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text('Начало: ${formatDateTime(period.startedAt)}'),
                    //     Text(
                    //       period.endedAt == null
                    //           ? 'Конец: активно'
                    //           : 'Конец: ${formatDateTime(period.endedAt!)}',
                    //     ),
                    //   ],
                    // ),
                    subtitle: Text(formatDateTime(event.dateTime)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: widget.elevatorsDao.getElevatorById(
                            elevatorId,
                          ),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text('Лифт...');
                            }

                            final elevator = snapshot.data!;

                            return Text('Лифт ${elevator.inventoryNumber}');
                          },
                        ),
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
  final DateTime startedAt;
  final DateTime? endedAt;

  EventPeriod({
    required this.elevatorId,
    required this.startedAt,
    required this.endedAt,
  });
}
