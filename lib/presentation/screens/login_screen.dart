import 'package:flutter/material.dart';
import 'package:mdklift/domain/entities/app_session.dart';
import 'package:mdklift/domain/repositories/auth_repository.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  final AuthRepository authRepository;
  final void Function(AppSession session) onLoggedIn; // callback-функция

  const LoginScreen({
    super.key,
    required this.authRepository,
    required this.onLoggedIn,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // для валидации введённых полей
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ipController = TextEditingController();
  final _portController = TextEditingController();

  bool _obscurePassword = true; // для скрытия введённого пароля

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String label,
    IconData? icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon) : null,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.05)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightBlue, width: 1.4),
      ),
      labelStyle: const TextStyle(fontSize: 14),
    );
  }

  void _submit() async {
    if (!_formKey.currentState!.validate())
      return; // Валидируем все введённые поля

    final login = _loginController.text.trim().toLowerCase();
    final password = _passwordController.text;
    final ip = _ipController.text.trim();
    final port = int.parse(_portController.text.trim());

    try {
      final session = await widget.authRepository.login(
        login: login,
        password: password,
        ip: ip,
        port: port,
      );

      widget.onLoggedIn(session); // callback в main
    } catch (e) {
      if (!mounted) return; // активен ли виджет после асинхронной операции
      _showError(e.toString(), context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey, // валидация
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.lock_outline_rounded,
                          size: 32,
                          color: AppColors.lightBlue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Вход в систему',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1D29),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: _loginController,
                        textInputAction: TextInputAction.next,
                        decoration: _inputDecoration(label: 'Логин'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Введите логин';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        controller: _passwordController,
                        obscureText:
                            _obscurePassword, // true или false для скрытия/показа пароля
                        textInputAction: TextInputAction.done,
                        decoration: _inputDecoration(
                          label: 'Пароль',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Введите пароль';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _ipController,
                              keyboardType: TextInputType.number,
                              decoration: _inputDecoration(label: 'IP-адрес'),
                              validator: (value) {
                                final text = value?.trim() ?? '';
                                if (text.isEmpty) {
                                  return 'Введите IP';
                                }

                                final regex = RegExp(
                                  r'^((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.){3}(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)$',
                                );

                                if (!regex.hasMatch(text)) {
                                  return 'Некорректный IP';
                                }

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _portController,
                              keyboardType: TextInputType.number,
                              decoration: _inputDecoration(
                                label: 'Порт',
                              ).copyWith(hintText: '4005'),
                              validator: (value) {
                                final text = value?.trim() ?? '';
                                if (text.isEmpty) return 'Введите порт';

                                final port = int.tryParse(text);
                                if (port == null || port < 1 || port > 65535) {
                                  return 'Некорректный порт';
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 17),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            _submit();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.lightBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Войти',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showError(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
