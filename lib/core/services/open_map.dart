import 'package:url_launcher/url_launcher.dart';

Future<void> openMapByAddress(String address) async {
  final encodedAddress = Uri.encodeComponent(address);

  final yandexUri = Uri.parse(
    'yandexmaps://maps.yandex.ru/?text=$encodedAddress',
  );

  final geoUri = Uri.parse('geo:0,0?q=$encodedAddress'); // универсально для любой карты (по умолчанию, например)

  final googleWebUri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$encodedAddress',
  );

  if (await canLaunchUrl(yandexUri)) {
    await launchUrl(yandexUri, mode: LaunchMode.externalApplication); // пробуем яндекс
    return;
  }

  if (await canLaunchUrl(geoUri)) {
    await launchUrl(geoUri, mode: LaunchMode.externalApplication); // пробуем другую карту
    return;
  }

  await launchUrl(googleWebUri, mode: LaunchMode.externalApplication); // web-карта fallback
}
