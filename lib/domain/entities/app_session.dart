import 'package:mdklift/domain/entities/app_user.dart';

class AppSession {
  final AppUser user;
  final String ip;
  final int port;
  final String? token;

  const AppSession({
    required this.user,
    required this.ip,
    required this.port,
    this.token,
  });
}