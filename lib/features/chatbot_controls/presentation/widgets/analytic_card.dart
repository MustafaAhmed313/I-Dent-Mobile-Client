import 'package:flutter/material.dart';
import 'package:i_dent_client/core/colors/app_font_styles.dart';

class AnalyticCard extends StatelessWidget {
  final String count;
  final String title;
  final Color? color;

  const AnalyticCard(
      {super.key, required this.title, required this.count, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          count,
          style: AppFontStyles.headline.copyWith(color: color),
        ),
        Text(title),
      ],
    );
  }
}
