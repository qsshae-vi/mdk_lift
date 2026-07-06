import 'package:flutter/services.dart';

Future<List<String>> getLiftEventIcons() async {
  final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  return manifest.listAssets()
      .where((path) => path.startsWith('assets/icons/lift_event/'))
      .where((path) => path.endsWith('.png'))
      .toList();
}