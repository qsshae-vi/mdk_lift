import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/date_time_utils.dart';
import 'package:mdklift/core/services/open_map.dart';
import 'package:mdklift/domain/entities/active_elevator_events.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/presentation/widgets/info_tile.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class MainInfoPage extends StatefulWidget {
  final Elevator elevator;
  final ActiveElevatorEventsRepository activeRepository;
  final UserRole? userRole; // для диспетчера немного другие данные

  const MainInfoPage({
    super.key,
    required this.elevator,
    required this.activeRepository,
    this.userRole,
  });

  @override
  State<MainInfoPage> createState() => _MainInfoPageState();
}

class _MainInfoPageState extends State<MainInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                StreamBuilder<List<ActiveElevatorEvents>>(
                  stream: widget.activeRepository.watchActiveEventsByElevatorId(
                    widget.elevator.elevatorId,
                  ),
                  builder: (context, snapshot) {
                    final events = snapshot.data ?? [];

                    if (events.isEmpty) {
                      return const InfoTile(
                        title: 'События',
                        value: 'Нет активных событий',
                      );
                    }

                    final topEvent = events[0];

                    return InfoTile(
                      title: "Событие (приоритетное)",
                      value: topEvent.eventName,
                      iconPath: topEvent.iconPath,
                    );
                  },
                ),
                InfoTile(
                  title: "Заводской номер",
                  value: widget.elevator.inventoryNumber,
                ),
                InfoTile(
                  title: "Тип-назначение",
                  value: widget.elevator.type,
                ),
                InfoTile(title: "Марка-модель", value: widget.elevator.model),
                InfoTile(
                  title: "Адрес установки",
                  value: widget.elevator.serviceInfo.address,
                  trailing: widget.userRole == UserRole.engineer
                      ? IconButton(
                          icon: const Icon(
                            Icons.navigation_outlined,
                            color: AppColors.darkBlue,
                            size: 25,
                          ),
                          onPressed: () {
                            openMapByAddress(
                              widget.elevator.serviceInfo.address,
                            );
                          },
                        )
                      : null,
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 1, // тень карточки
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: Color(0xFFE6E6EB)),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Все события на блоке:",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        StreamBuilder<List<ActiveElevatorEvents>>(
                          stream: widget.activeRepository
                              .watchActiveEventsByElevatorId(
                                widget.elevator.elevatorId,
                              ),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.lightBlue,
                                ),
                              );
                            }

                            final elevatorActiveEventsList = snapshot.data!;

                            return ListView.builder(
                              shrinkWrap:
                                  true, // только столько места, сколько нужно
                              physics:
                                  const NeverScrollableScrollPhysics(), // не скроллится
                              itemCount: elevatorActiveEventsList.length,
                              itemBuilder: (context, index) {
                                final event = elevatorActiveEventsList[index];
                                return ListTile(
                                  leading: Image.asset(
                                    event.iconPath,
                                    width: 20,
                                    height: 20,
                                  ),
                                  title: Text(event.eventName),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(formatDateTime(event.updatedAt)),
                                      Text('Приоритет: ${event.priority}'),
                                      Text('Категория: ${event.category}'),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
