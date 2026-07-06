import 'package:flutter/material.dart';
import 'package:mdklift/core/utils/layout_utils.dart';
import 'package:mdklift/data/database/dao/elevators_dao.dart';
import 'package:mdklift/data/database/dao/event_types_dao.dart';
import 'package:mdklift/data/implementations/elevator_repository.dart';
import 'package:mdklift/data/mock/mock_elevator_repository_impl.dart';
import 'package:mdklift/data/remote/okean_events_sync_service.dart';
import 'package:mdklift/domain/entities/elevator.dart';
//import 'package:vkrb/core/exceptions/server_exception.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/domain/repositories/auth_repository.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/presentation/screens/elevator_card_screen.dart';
import 'package:mdklift/presentation/screens/events_history_screen.dart';
import 'package:mdklift/presentation/screens/search_screen.dart';
import 'package:mdklift/presentation/widgets/drawer_item.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';
import 'package:mdklift/presentation/widgets/legend_item_widget.dart';

class ElevatorsMonitoring extends StatefulWidget {
  final AuthRepository authRepository;
  final void Function() onLogOut; // callback-функция
  final ElevatorRepositoryImpl repository;
  final ActiveElevatorEventsRepository activeRepository;
  final HistoryElevatorEventsRepository historyRepository;
  final ElevatorsDao elevatorsDao;
  final EventTypesDao eventTypesDao;
  final OkeanEventsSyncService okeanEventsSyncService;

  const ElevatorsMonitoring({
    super.key,
    required this.onLogOut,
    required this.authRepository,
    required this.repository,
    required this.activeRepository,
    required this.historyRepository,
    required this.elevatorsDao,
    required this.eventTypesDao,
    required this.okeanEventsSyncService,
  });

  @override
  State<ElevatorsMonitoring> createState() => _ElevatorsMonitoringState();
}

class _ElevatorsMonitoringState extends State<ElevatorsMonitoring> {
  late final Stream<List<Elevator>> elevatorsStream;
  final ScrollController _scrollController =
      ScrollController(); // для прокрутки списка вверх

  @override
  void initState() {
    super.initState();
    elevatorsStream = widget.repository.watchElevators();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Режим мониторинга"),
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
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.help_outline,
                color: AppColors.darkBlue,
                size: 25,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0, // к началу списка
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
          );
        },
        backgroundColor: AppColors.lightBlue,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.keyboard_arrow_up_rounded,
          color: Colors.black,
          size: 28,
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
              DrawerItem(
                icon: Icons.history_rounded,
                title: 'История событий',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EventsHistoryScreen(
                        historyRepository: widget.historyRepository,
                        elevatorsDao: widget.elevatorsDao,
                        eventTypesDao: widget.eventTypesDao,
                      ),
                    ),
                  );
                },
              ),

              DrawerItem(
                icon: Icons.search,
                title: 'Поиск по адресам',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchScreen(
                        activeRepository: widget.activeRepository,
                        historyRepository: widget.historyRepository,
                        elevatorsDao: widget.elevatorsDao,
                        okeanEventsSyncService: widget.okeanEventsSyncService,
                      ),
                    ),
                  );
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

      // --- Правое боковое меню ---
      endDrawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 35),

            // Справочник фильтров
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 14, // горизонтальный отступ в строке
              runSpacing: 8, // вертикальный отступ, если произошёл перенос
              children: filters.map((item) {
                return legendItem(item.color, item.category);
              }).toList(),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Text(
                'Справочник событий',
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

            Expanded(
              child: FutureBuilder(
                future: widget.eventTypesDao.getEventTypes(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final eventTypes = snapshot.data!;

                  return Stack(
                    children: [
                      ListView(
                        children: eventTypes.map((elEv) {
                          return ListTile(
                            leading: Image.asset(
                              elEv.iconPath,
                              width: 35,
                              height: 35,
                            ),
                            title: Text(elEv.name),
                            subtitle: Text("Категория: ${elEv.category}, приоритет: ${elEv.priority}"),
                          );
                        }).toList(),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Лифтовые установки
      body: Stack(
        children: [
          StreamBuilder<List<Elevator>>(
            stream: elevatorsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Ошибка загрузки данных',
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.lightBlue),
                );
              }

              final elevatorsList = snapshot.data!;

              final filteredByEvents = selectedCategory == 'Все'
                  ? elevatorsList
                  : elevatorsList.where((elevator) {
                      if (elevator.activeEvents.isEmpty) return false;

                      // Категория приоритетного события блока
                      return elevator.priorityEvent!.category ==
                          selectedCategory;
                    }).toList();

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: chooseCrossAxisCount(context),
                  crossAxisSpacing: 12, //между колонками
                  mainAxisSpacing: 12, //между строками
                  childAspectRatio: 2.2, //соотношение ширины к высоте
                ),
                controller: _scrollController,

                itemCount: filteredByEvents.length,
                itemBuilder: (context, index) {
                  final elevator = filteredByEvents[index];

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
                              okeanEventsSyncService: widget.okeanEventsSyncService,
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
                                    elevator
                                        .displayEventIconPath, // наиболее приоритетное событие
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
                                      // иконки активных событий на блоке
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
                                    elevator.model, // Модель лифтовой установки
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
              );
            },
          ),

          // для аккуратной прокрутки списка лифтов
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

          // ----- Фильтрация событий по категориям -----
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: filters.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: filterButton(filter.color, filter.category),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String selectedCategory = 'Все';

  final filters = const [
    EventCategoryFilter(
      color: Color.fromARGB(145, 199, 225, 247),
      category: 'Отключение',
    ),
    EventCategoryFilter(
      color: Color.fromARGB(165, 255, 178, 172),
      category: 'Авария',
    ),
    EventCategoryFilter(
      color: Color.fromARGB(158, 248, 212, 157),
      category: 'Неисправность',
    ),
    EventCategoryFilter(
      color: Color.fromARGB(160, 188, 247, 190),
      category: 'Информация',
    ),
  ];

  Widget filterButton(Color color, String category) {
    final selected = (selectedCategory == category); // bool

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = selected
              ? 'Все'
              : category; // Если кнопка уже была выбрана, то Все
        });
      },
      child: Container(
        width: 50,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
          border: selected
              ? Border.all(color: AppColors.darkBlue, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCategoryFilter {
  final Color color;
  final String category;

  const EventCategoryFilter({required this.color, required this.category});
}
