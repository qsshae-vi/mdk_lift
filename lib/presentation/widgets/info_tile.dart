import 'package:flutter/material.dart';
import 'package:mdklift/presentation/theme/app_colors.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final String? iconPath;
  final Widget? trailing;

  const InfoTile({
    super.key,
    required this.title,
    required this.value,
    this.iconPath,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              Text(
                title, // Название параметра
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 8),
              if (iconPath !=
                  null) // collection if - виджет добавляется, только если условие выполняется
                Image.asset(
                  iconPath!,
                  width: 30,
                  height: 30,
                  errorBuilder: (_, _, _) =>
                      const SizedBox(width: 22, height: 22),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value, // Значение параметра
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          SizedBox(height: 10),
          Divider(height: 2, color: Colors.grey),
        ],
      ),
    );
  }
}
