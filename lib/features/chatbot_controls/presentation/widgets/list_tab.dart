import 'package:flutter/material.dart';

import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/core/colors/app_font_styles.dart';

class ListTab extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback? onTap;

  const ListTab(
      {super.key, required this.isSelected, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: isSelected ? BorderRadius.circular(25) : null,
          color: isSelected ? AppColors.primary : null,
        ),
        child: Center(
          child: Text(
            title,
            style: AppFontStyles.body
                .copyWith(color: isSelected ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
