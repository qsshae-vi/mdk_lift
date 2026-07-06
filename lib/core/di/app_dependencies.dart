import 'package:mdklift/core/utils/notification_service.dart';
import 'package:mdklift/data/database/app_database.dart';
import 'package:mdklift/data/implementations/elevator_active_events_repository_impl.dart';
import 'package:mdklift/data/implementations/elevator_history_repository_impl.dart';
import 'package:mdklift/data/implementations/elevator_repository.dart';
import 'package:mdklift/data/mock/mock_elevator_repository_impl.dart';
import 'package:mdklift/data/mock/mock_elevator_server.dart';
import 'package:mdklift/data/remote/mock_okean_api_server.dart';
import 'package:mdklift/data/remote/okean_event_mapper.dart';
import 'package:mdklift/data/remote/okean_events_sync_service.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/repositories/active_elevator_events_repository.dart';
import 'package:mdklift/domain/repositories/history_elevator_events_repository.dart';
import 'package:mdklift/domain/elevator_events_sync_service.dart';

class AppDependencies {
  late final AppDatabase db;
  //late final MockElevatorServer server;
  //late final MockElevatorRepository repository;
  late final ElevatorRepositoryImpl repository;
  late final ActiveElevatorEventsRepository activeRepository;
  late final HistoryElevatorEventsRepository historyRepository;
  late final OkeanEventsSyncService okeanSyncService;
  late final NotificationService notificationService;


  AppDependencies() {
    db = AppDatabase();

    activeRepository = ElevatorActiveEventsRepositoryImpl(db.activeEventsDao);
    historyRepository = ElevatorHistoryRepositoryImpl(db.historyEventsDao);

    notificationService = NotificationService();

    final syncService = ElevatorEventsSyncService(
      activeRepository: activeRepository,
      historyRepository: historyRepository,
      notificationService:  notificationService
    );

    final api = MockOkeanApiServer(db.elevatorsDao, db.eventTypesDao);  // mock-сервер начинает генерировать события

    okeanSyncService = OkeanEventsSyncService(  // синхронизация событий: перевод в ElevatorEvent и сохранение в БД
      api: api,
      elevatorsDao: db.elevatorsDao,
      eventMapper: OkeanEventMapper(db.eventTypesDao),
      syncService: syncService,
    );

    api.start();
    okeanSyncService.start();

    //server = MockElevatorServer(db.elevatorsDao, syncService, db.eventTypesDao);
    //repository = MockElevatorRepository(server);
    repository = ElevatorRepositoryImpl(db.elevatorsDao, db.activeEventsDao);   // метод SSOT

    activeRepository.clearAll();
    //server.start();
  }

  void dispose() {
    //server.dispose();
    db.close();
  }
}
