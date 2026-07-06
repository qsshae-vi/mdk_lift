enum UserRole { dispatcher, engineer }

class AppUser {
  final String id;
  final String login;
  final UserRole role;

  const AppUser({required this.id, required this.login, required this.role});

}
