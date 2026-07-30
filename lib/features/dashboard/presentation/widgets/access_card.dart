import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/core/colors/app_font_styles.dart';
import 'package:i_dent_client/core/colors/custom_shadows.dart';

class AccessCard extends StatelessWidget {
  final FaIconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;

  const AccessCard(
      {super.key,
      required this.icon,
      required this.title,
      this.onTap,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [SoftShadow()],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                FaIcon(
                  icon,
                  size: 50,
                  color: iconColor ?? AppColors.primary,
                ),
                Text(
                  title,
                  style: AppFontStyles.label,
                )
              ],
            ),
          
        ),
      ),
    );
  }
}
