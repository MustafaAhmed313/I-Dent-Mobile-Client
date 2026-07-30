import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:i_dent_client/core/colors/index.dart';

class GradiantBanner extends StatelessWidget {
  const GradiantBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: AppColors.gradientPrimary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: CircleAvatar(
              backgroundColor: Colors.white12,
              radius: 25,
              child: Icon(
                LucideIcons.sparkles,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 1,
            children: [
              Text("المساعد الذكي",
                  style:
                      AppFontStyles.sectionTitle.copyWith(color: Colors.white)),
              Text("عروض • أبحاث • مخزون",
                  style: AppFontStyles.micro.copyWith(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
