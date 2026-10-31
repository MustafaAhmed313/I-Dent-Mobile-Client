import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';

class AuthFromButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String title;
  final double mediaQueryWidth;

  const AuthFromButton(
      {super.key,
      required this.isActive,
      required this.onTap,
      required this.title,
      required this.mediaQueryWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 0.9 * mediaQueryWidth * 0.49,
        height: 45,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          title,
          style: AppFontStyles.label.copyWith(
              color:
                  isActive ? AppColors.primary : Colors.white.withOpacity(0.8),
              fontSize: 13),
        )),
      ),
    );
  }
}
