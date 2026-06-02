import 'package:flutter/material.dart';
import './app_colors.dart';

class ElegantShadow extends Shadow {
  ElegantShadow() : super(
      offset: const Offset(0, 10),
      blurRadius: 30, 
      color: AppColors.primary.withAlpha((0.35 * 255).round()),
  );
}

class SoftShadow extends Shadow {
  SoftShadow() : super(
      offset: const Offset(0, 4),
      blurRadius: 14, 
      color: AppColors.primary.withAlpha((0.18 * 255).round()),
  );
}
