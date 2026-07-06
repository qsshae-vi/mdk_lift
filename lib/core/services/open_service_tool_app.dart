import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

Future<void> openServiceToolApp(BuildContext context) async {
  final appUri = Uri.parse('servicetoolapp://open');
  final websiteUri = Uri.parse(
    'https://www.essan.ru/products-and-solutions/po-sys/po-soyuz/tool-souyz',
  );

  try {
    await launchUrl(appUri, mode: LaunchMode.externalApplication);
  } catch (_) {
    Navigator.of(context).pop(); // закрыть боковое меню
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Приложение не установлено',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: const Text(
          'Перейти на сайт для скачивания?',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Отмена',
              style: TextStyle(color: AppColors.darkBlue),
            ),
          ),
          TextButton(
            onPressed: () {
              launchUrl(websiteUri, mode: LaunchMode.externalApplication);
            },
            child: const Text(
              'Открыть',
              style: TextStyle(color: AppColors.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
