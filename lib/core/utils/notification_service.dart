import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mdklift/domain/entities/app_user.dart';
import 'package:mdklift/domain/entities/elevator_event.dart';

class NotificationService {
  NotificationService();

  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _eventsChannel =
      AndroidNotificationChannel(
        'elevator_events',
        'События лифтов',
        description: 'Уведомления о событиях лифтов',
        importance: Importance.max,
      );

  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(initializationSettings);

    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(_eventsChannel);

    if (Platform.isAndroid) {
      await androidPlugin?.requestNotificationsPermission();
    }
  }

  Future<void> showEventNotification({
    required String elevatorInventoryNumber,
    required ElevatorEvent event,
  }) async {
    const currentRole = UserRole.engineer;

    if (currentRole != UserRole.engineer) return;

    final largeIconBytes = await _loadAssetIconBytes(event.iconPath);

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'Лифт $elevatorInventoryNumber',
      event.name,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _eventsChannel.id,
          _eventsChannel.name,
          channelDescription: _eventsChannel.description,
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,

          // Маленькая иконка. Она НЕ может быть из assets.
          icon: '@mipmap/ic_launcher',

          // Большая иконка. Вот сюда ставим иконку события из assets.
          largeIcon: ByteArrayAndroidBitmap(largeIconBytes),
        ),
      ),
    );
  }

  final currentRole = UserRole.engineer;

  Future<void> showCriticalEventNotification({
    required String elevatorInventoryNumber,
    required ElevatorEvent event,
  }) async {

    if (currentRole != UserRole.engineer) return;

    final isCritical =
        event.category == 'Авария' || event.category == 'Неисправность' || event.category == 'Отключение';

    if (!isCritical) return;

    await showEventNotification(
      elevatorInventoryNumber: elevatorInventoryNumber,
      event: event,
    );
  }

  Future<void> showCabinCallNotification({
    required String elevatorInventoryNumber,
    required ElevatorEvent event,
  }) async {
    if (currentRole != UserRole.engineer) return;

    final isCabinCall = event.name == 'Есть Вызов из Кабины';

    if (!isCabinCall) return;

    final largeIconBytes = await _loadAssetIconBytes(event.iconPath);

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'Вызов из кабины',
      'Лифт $elevatorInventoryNumber: ${event.name}',
      NotificationDetails(
        android: AndroidNotificationDetails(
          _eventsChannel.id,
          _eventsChannel.name,
          channelDescription: _eventsChannel.description,
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
          icon: '@mipmap/ic_launcher',
          largeIcon: ByteArrayAndroidBitmap(largeIconBytes),
        ),
      ),
    );
  }

  Future<Uint8List> _loadAssetIconBytes(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }
}
