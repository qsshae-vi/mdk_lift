import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdklift/data/remote/okean_events_sync_service.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/pages/addition_info_page.dart';
import 'package:mdklift/presentation/pages/main_info_page.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class ElevatorCardPage extends StatelessWidget {
  final Elevator elevator;
  final ActiveElevatorEventsRepository activeRepository;
  final HistoryElevatorEventsRepository historyRepository;
  final UserRole? userRole; // для диспетчера немного другие данные
  final OkeanEventsSyncService okeanEventsSyncService;


  const ElevatorCardPage({
    super.key,
    required this.elevator,
    required this.activeRepository,
    required this.historyRepository,
    this.userRole,
    required this.okeanEventsSyncService,
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
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.lightBlue),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Лифт ${elevator.type}",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.lightBlue,
                ),
              ),
              Text(
                elevator.inventoryNumber,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            // для отображения "в реальном времени"
            ValueListenableBuilder(
              valueListenable: okeanEventsSyncService.isServerAvailable,
              builder: (context, isAvailable, _) {
                return Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isAvailable ? Colors.green : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isAvailable ? 'Обновлено' : 'Нет связи',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 12),
                  ],
                );
              },
            ),
          ],
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
                    Tab(text: "Основное"),
                    Tab(text: "Доп. инфо"),
                  ],
                ),
              ),
            ),
          ),
          //досюда
        ),

        body: TabBarView(
          children: [
            MainInfoPage(
              elevator: elevator,
              activeRepository: activeRepository,
              userRole: userRole,
            ),
            AdditionInfoPage(
              elevator: elevator,
              historyRepository: historyRepository,
            ),
          ],
        ),
      ),
    );
  }
}
