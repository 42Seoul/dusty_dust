import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  final String category;
  final String imgPath;
  final String level;
  final String stat;
  final double width;

  const MainStat(
      {super.key,
      required this.category,
      required this.imgPath,
      required this.level,
      required this.stat,
      required this.width});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: Colors.black);
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(category, style: ts),
          const SizedBox(height: 8),
          Image.asset(
            imgPath,
            width: 50,
          ),
          const SizedBox(height: 4),
          Text(level, style: ts),
          const SizedBox(height: 4),
          Text(stat, style: ts),
        ],
      ),
    );
  }
}
