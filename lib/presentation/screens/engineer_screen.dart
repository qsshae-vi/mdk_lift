import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/layout_utils.dart';
import 'package:mdklift/core/services/open_service_tool_app.dart';
import 'package:mdklift/data/implementations/elevator_repository.dart';
import 'package:mdklift/data/mock/mock_elevator_repository_impl.dart';
import 'package:mdklift/data/remote/okean_events_sync_service.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/entities/elevator.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/domain/repositories/auth_repository.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/screens/elevator_card_screen.dart';
import 'package:mdklift/presentation/widgets/drawer_item.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class EngineerScreen extends StatefulWidget {
  final AuthRepository authRepository;
  final void Function() onLogOut; // callback-функция
  final ElevatorRepositoryImpl repository;
  final ActiveElevatorEventsRepository activeRepository;
  final HistoryElevatorEventsRepository historyRepository;
  final OkeanEventsSyncService okeanEventsSyncService;

  const EngineerScreen({
    super.key,
    required this.onLogOut,
    required this.authRepository,
    required this.repository,
    required this.activeRepository,
    required this.historyRepository,
    required this.okeanEventsSyncService,
  });

  @override
  State<EngineerScreen> createState() => _EngineerScreenState();
}

class _EngineerScreenState extends State<EngineerScreen> {
  late Future<List<Elevator>> elevatorsState;

  @override
  void initState() {
    super.initState();
    elevatorsState = widget.repository.getElevators();
  }

  Future<void> _reload() async {
    setState(() {
      elevatorsState = widget.repository.getElevators();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Режим мастера"),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightBlue,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.dehaze, size: 22, color: AppColors.darkBlue),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              size: 22,
              color: AppColors.darkBlue,
            ),
            onPressed: _reload,
          ),
        ],
        // Наличие соединения с сервером
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(27),
          child: ValueListenableBuilder(
            valueListenable: widget.okeanEventsSyncService.isServerAvailable,

            builder: (context, isAvailable, _) {
              if (isAvailable) {
                return const SizedBox.shrink();
              }

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_off, size: 15, color: Colors.red),
                    SizedBox(width: 6),
                    Text(
                      'Нет соединения с сервером',
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),

      // --- Левое боковое меню ---
      drawer: Drawer(
        backgroundColor: AppColors.backgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Text(
                  'Меню',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightBlue,
                  ),
                ),
              ),

              const Divider(
                height: 7,
                color: AppColors.lightBlue,
                thickness: 0.5,
              ),
              SizedBox(height: 7),

              // Пункты меню
              // DrawerItem(
              //   icon: Icons.history_rounded,
              //   title: 'История событий',
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (_) => EventsHistoryScreen(
              //           historyRepository: historyRepository,
              //         ),
              //       ),
              //     );
              //   },
              // ),
              DrawerItem(
                icon: Icons.search,
                title: 'Сервисный режим',
                onTap: () {
                  openServiceToolApp(this.context);
                },
              ),

              SizedBox(height: 7),
              const Divider(
                height: 7,
                color: AppColors.lightBlue,
                thickness: 0.3,
              ),
              SizedBox(height: 7),

              DrawerItem(
                icon: Icons.exit_to_app,
                title: 'Выход',
                onTap: () async {
                  await widget.authRepository.logout();
                  widget.onLogOut();
                },
              ),
            ],
          ),
        ),
      ),

      // Лифтовые установки
      body: Stack(
        children: [
          FutureBuilder<List<Elevator>>(
            future: elevatorsState,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.lightBlue),
                );
              }

              final elevatorsList = snapshot.data!;

              final filteredElevators =
                  elevatorsList // допустим, выделены первые 3
                      .take(3) // пример условия
                      .toList();

              return RefreshIndicator(
                // pull-to-refresh
                color: AppColors.darkBlue, // цвет кружка
                backgroundColor: Colors.white, // фон кружка
                strokeWidth: 2.5, // толщина линии
                displacement: 0, // где остановится индикатор

                onRefresh: _reload,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: chooseCrossAxisCount(context),
                    crossAxisSpacing: 12, //между колонками
                    mainAxisSpacing: 12, //между строками
                    childAspectRatio: 2.2, //соотношение ширины к высоте
                  ),
                  itemCount: filteredElevators.length,
                  itemBuilder: (context, index) {
                    final elevator = filteredElevators[index];

                    return Card(
                      elevation: 1, // тень карточки
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: const BorderSide(color: Color(0xFFE6E6EB)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ElevatorCardPage(
                                elevator: elevator,
                                activeRepository: widget.activeRepository,
                                historyRepository: widget.historyRepository,
                                userRole: UserRole.engineer,
                                okeanEventsSyncService:
                                    widget.okeanEventsSyncService,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      elevator.displayEventIconPath,
                                      width: 35,
                                      height: 35,
                                      errorBuilder: (_, _, _) =>
                                          const SizedBox(width: 24, height: 24),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      elevator.displayEventName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Wrap(
                                      spacing: 4,
                                      runSpacing: 4,
                                      children: elevator.activeEvents.map((
                                        event,
                                      ) {
                                        return Image.asset(
                                          event.iconPath,
                                          width: 16,
                                          height: 16,
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      elevator
                                          .inventoryNumber, // Номер эксплуатационный
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    SizedBox(height: 4),
                                    Text(
                                      elevator
                                          .model, // Модель лифтовой установки
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF444444),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      elevator.type, // Тип лифтовой установки
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(height: 4),

                                    Text(
                                      elevator.serviceInfo.address, // Адрес
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF444444),
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
