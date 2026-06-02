import 'package:flutter/material.dart';
import './app_colors.dart';

class ElegantShadow extends BoxShadow {
  ElegantShadow() : super(
      offset: const Offset(0, 10),
      blurRadius: 30,
      spreadRadius: -10,
      color: AppColors.primary.withAlpha((0.35 * 255).round()),
  );
}

class SoftShadow extends BoxShadow {
  SoftShadow() : super(
      offset: const Offset(0, 4),
      blurRadius: 14,
      spreadRadius: -4, 
      color: AppColors.primary.withAlpha((0.18 * 255).round()),
  );
}
