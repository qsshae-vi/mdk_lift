import 'package:flutter/material.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/pages/history_by_elevator_page.dart';
import 'package:mdklift/presentation/pages/history_by_events_page.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

// Экран для отображения истории как по событиям, так и по лифтам
class EventsHistoryScreen extends StatelessWidget {
  final HistoryElevatorEventsRepository historyRepository;
  final ElevatorsDao elevatorsDao;
  final EventTypesDao eventTypesDao;

  const EventsHistoryScreen({
    super.key,
    required this.historyRepository,
    required this.elevatorsDao,
    required this.eventTypesDao,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.lightBlue,
              size: 22,
            ),
          ),
          title: Text(
            "История событий",
            style: const TextStyle(
              fontSize: 22,
              color: AppColors.lightBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          //отсюда
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Container(
                height: 44,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9E9EE),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  labelColor: const Color(0xFF2B2B2B),
                  unselectedLabelColor: AppColors.lightBlue,
                  labelStyle: const TextStyle(fontSize: 17),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.lightBlue,
                        blurRadius: 6,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  tabs: const [
                    Tab(text: "По событиям"),
                    Tab(text: "По лифтам"),
                  ],
                ),
              ),
            ),
          ),
          //досюда
        ),
        body: TabBarView(
          children: [
            HistoryByEventsPage(
              historyRepository: historyRepository,
              elevatorsDao: elevatorsDao,
              eventTypesDao: eventTypesDao,
            ),
            HistoryByElevatorPage(
              historyRepository: historyRepository,
              elevatorsDao: elevatorsDao,
            ),
          ],
        ),
      ),
    );
  }
}
