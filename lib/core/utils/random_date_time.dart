import 'dart:math';


DateTime randomDateTime() {
  final now = DateTime.now();
  return now.subtract(Duration(minutes: Random().nextInt(120)));
}