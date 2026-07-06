import 'package:flutter/material.dart';

int chooseCrossAxisCount(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return 1;
  } else if (width < 1000) {
    return 2;
  } else if (width < 1400) {
    return 3;
  } else {
    return 4;
  }
}
