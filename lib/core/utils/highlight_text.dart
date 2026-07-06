import 'package:flutter/material.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

Widget highlightText(String text, String query) {
  if (query.isEmpty) {
    return Text(text);
  }

  final lowerText = text.toLowerCase();
  final lowerQuery = query.toLowerCase();

  final startIndex = lowerText.indexOf(
    lowerQuery,
  ); // с какого слова начинается запрос (по порядку)

  if (startIndex == -1) {
    // совпадений нет
    return Text(text);
  }

  final endIndex = startIndex + query.length; // конец совпадения

  return RichText(
    // части строки разными стилями
    text: TextSpan(
      children: [
        TextSpan(
          text: text.substring(0, startIndex),
          style: const TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
        ),
        TextSpan(
          text: text.substring(startIndex, endIndex),
          style: const TextStyle(
            color: AppColors.blueForSearch,
            fontFamily: 'Montserrat',
          ),
        ),
        TextSpan(
          text: text.substring(endIndex),
          style: const TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
        ),
      ],
    ),
  );
}
