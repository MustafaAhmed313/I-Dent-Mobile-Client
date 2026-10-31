import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';

import 'analytic_card.dart';

class AnalyticsGrid extends StatelessWidget {
  const AnalyticsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
              padding: EdgeInsets.only(top: 20),
              mainAxisExtent: 80,
          crossAxisCount: 3,
          children: [
            AnalyticCard(
                title: "محادثات اليوم", count: "47", color: AppColors.primary),
            AnalyticCard(
              title: "حجوزات",
              count: "23",
              color: AppColors.success,
            ),
            AnalyticCard(title: "ردود تلقائية", count: "189"),
            AnalyticCard(
                title: "تأكيدات", count: "31", color: AppColors.primary),
            AnalyticCard(
                title: "تذكيرات", count: "28", color: AppColors.success),
            AnalyticCard(title: "تقييمات", count: "15"),
          ],
        );
  }
}