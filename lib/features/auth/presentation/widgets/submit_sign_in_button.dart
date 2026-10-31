import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';

class SubmitSignInButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool showArrow;

  const SubmitSignInButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF00CBA9), Color(0xFF00A98C)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00C9A7).withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(
                  label,
                  style: AppFontStyles.label.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (showArrow)
                  const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}