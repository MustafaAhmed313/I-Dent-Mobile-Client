import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/index.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  VoidCallback? onTap;

  BottomNavigationItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: isSelected ? AppColors.primary : null,
                ),
                Text(
                  label,
                  style: AppFontStyles.label.copyWith(
                      color: isSelected ? AppColors.primary : null, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
