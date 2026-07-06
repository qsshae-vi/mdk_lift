import 'package:flutter/material.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

Widget legendItem(Color color, String text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
      ),
      const SizedBox(width: 7),
      Text(
        text,
        style: const TextStyle(fontSize: 14, color: AppColors.darkBlue),
      ),
    ],
  );
}
