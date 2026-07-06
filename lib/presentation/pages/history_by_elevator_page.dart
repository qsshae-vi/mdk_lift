import 'package:flutter/material.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/screens/elevator_events_history_screen.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class HistoryByElevatorPage extends StatefulWidget {
  final HistoryElevatorEventsRepository historyRepository;
  final ElevatorsDao elevatorsDao;

  const HistoryByElevatorPage({
    super.key,
    required this.historyRepository,
    required this.elevatorsDao,
  });

  @override
  State<HistoryByElevatorPage> createState() => _HistoryByElevatorPageState();
}

class _HistoryByElevatorPageState extends State<HistoryByElevatorPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.elevatorsDao.getElevators(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final elevators = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    children: elevators.map((el) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          elevation: 1, // тень
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(el.inventoryNumber),
                            subtitle: Text(el.serviceInfo.address),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: AppColors.darkBlue,
                            ),
                            tileColor: Colors.white,
                            splashColor: AppColors.lightBlue.withValues(
                              alpha: 0.2,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ElevatorEventsHistoryScreen(
                                    elevator: el,
                                    historyRepository: widget.historyRepository,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }).toList(), // материализуем под ListView
                  ),
                ],
              ),
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
    );
  }
}
