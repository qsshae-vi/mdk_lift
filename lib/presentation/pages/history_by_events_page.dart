import 'package:flutter/material.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/screens/history_by_event_screen.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class HistoryByEventsPage extends StatefulWidget {
  final HistoryElevatorEventsRepository historyRepository;
  final ElevatorsDao elevatorsDao;
  final EventTypesDao eventTypesDao;

  const HistoryByEventsPage({
    super.key,
    required this.historyRepository,
    required this.elevatorsDao,
    required this.eventTypesDao,
  });

  @override
  State<HistoryByEventsPage> createState() => _HistoryByEventsPageState();
}

class _HistoryByEventsPageState extends State<HistoryByEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FutureBuilder(
            future: widget.eventTypesDao.getEventTypes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final events = snapshot.data!;

              return Stack(
                children: [
                  ListView(
                    children: events.map((elEv) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              elEv.iconPath,
                              width: 35,
                              height: 35,
                            ),
                            title: Text(elEv.name),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: AppColors.darkBlue,
                            ),
                            tileColor: Colors.white,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HistoryByEventScreen(
                                    event: elEv,
                                    historyRepository: widget.historyRepository,
                                    elevatorsDao: widget.elevatorsDao,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }).toList(), // материализуем под ListView
                  ),
                  IgnorePointer(
                    child: Container(
                      height: 15,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
