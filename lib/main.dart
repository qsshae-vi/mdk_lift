import 'package:flutter/material.dart';
import 'package:mdklift/core/di/app_dependencies.dart';
import 'package:mdklift/core/utils/notification_service.dart';
import 'package:mdklift/data/mock/mock_auth_repository_impl.dart';
import 'package:mdklift/domain/entities/app_session.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/repositories/auth_repository.dart';
import 'package:mdklift/presentation/screens/elevators_monitoring_screen.dart';
import 'package:mdklift/presentation/screens/engineer_screen.dart';
import 'package:mdklift/presentation/screens/login_screen.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Обязательно для асинхронной инициализации до runApp

  //await NotificationService.initialize();

  final authRepository = MockAuthRepositoryImpl();
  final session = await authRepository.getCurrentSession();

  runApp(MainApp(initialSession: session, authRepository: authRepository));
}

class MainApp extends StatefulWidget {
  final AuthRepository authRepository;
  final AppSession? initialSession;

  const MainApp({
    super.key,
    required this.initialSession,
    required this.authRepository,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppDependencies
  dependencies; // для инициализации БД, сервера, репозиториев
  late AppSession? _session;

  @override
  void initState() {
    super.initState();
    _session = widget.initialSession; // для SharedPreferences
    dependencies = AppDependencies();
  }

  @override
  void dispose() {
    dependencies.dispose();
    super.dispose();
  }

  void _onLoggedIn(AppSession session) {
    // вызывается из LoginScreen
    setState(() {
      _session = session;
    });
  }

  void _onLogout() {
    // вызывается из MonitoringScreen
    setState(() {
      _session = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: _session == null
          ? LoginScreen(
              authRepository: widget.authRepository,
              onLoggedIn: _onLoggedIn,
            )
          : _homeByRole(_session!.user, _onLogout),
    );
  }

  Widget _homeByRole(AppUser user, VoidCallback onLogOut) {
    switch (user.role) {
      case UserRole.dispatcher:
        return ElevatorsMonitoring(
          onLogOut: onLogOut,
          authRepository: widget.authRepository,
          repository: dependencies.repository,
          activeRepository: dependencies.activeRepository,
          historyRepository: dependencies.historyRepository,
          elevatorsDao: dependencies.db.elevatorsDao,
          eventTypesDao: dependencies.db.eventTypesDao,
          okeanEventsSyncService: dependencies.okeanSyncService,
        );
      case UserRole.engineer:
        return EngineerScreen(
          onLogOut: onLogOut,
          authRepository: widget.authRepository,
          repository: dependencies.repository,
          activeRepository: dependencies.activeRepository,
          historyRepository: dependencies.historyRepository,
          okeanEventsSyncService: dependencies.okeanSyncService,
        );
    }
  }
}
