import 'package:shared_preferences/shared_preferences.dart';
import 'package:mdklift/domain/entities/app_session.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/core/exceptions/auth_exception.dart';
import 'package:mdklift/domain/repositories/auth_repository.dart';

class MockAuthRepositoryImpl implements AuthRepository {
  static const _keyUserId = 'user_id';
  static const _keyLogin = 'user_login';
  static const _keyRole = 'user_role';
  static const _keyIP = 'user_ip';
  static const _keyPort = 'user_port';

  @override
  Future<AppSession> login({
    required String login,
    required String password,
    required String ip,
    required int port,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    late final AppUser user;

    if (login == 'диспетчер' && password == '1234') {
      user = const AppUser(
        id: '1',
        login: 'dispatcher',
        role: UserRole.dispatcher,
      );
    } else if (login == 'инженер' && password == '1234') {
      user = const AppUser(id: '2', login: 'engineer', role: UserRole.engineer);
    } else if (password == '777 555') {
      throw AuthException('Не удалось подключиться к серверу');
    } else {
      throw AuthException('Неверный логин или пароль');
    }

    final session = AppSession(user: user, ip: ip, port: port);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, user.id);
    await prefs.setString(_keyLogin, user.login);
    await prefs.setString(_keyRole, user.role.name);
    await prefs.setString(_keyIP, ip);
    await prefs.setInt(_keyPort, port);

    return session;
  }

  @override
  Future<AppSession?> getCurrentSession() async {
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getString(_keyUserId);
    final login = prefs.getString(_keyLogin);
    final roleRaw = prefs.getString(_keyRole);
    final ip = prefs.getString(_keyIP);
    final port = prefs.getInt(_keyPort);

    if (userId == null ||
        login == null ||
        roleRaw == null ||
        ip == null ||
        port == null) {
      return null;
    }

    final role = UserRole.values.firstWhere(
      (e) => e.name == roleRaw,
      orElse: () => UserRole.dispatcher,
    );

    return AppSession(
      user: AppUser(id: userId, login: login, role: role),
      ip: ip,
      port: port,
    );
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
