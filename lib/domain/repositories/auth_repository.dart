import 'package:mdklift/domain/entities/app_session.dart';

abstract class AuthRepository {
  Future<AppSession> login({
    required String login,
    required String password,
    required String ip,
    required int port,
  });

  Future<void> logout();

  Future<AppSession?> getCurrentSession();
}
