import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff0071d6);
  static const Color primaryGlow = Color(0xff02a9f7);
  static const Color background = Color(0xfff7fbfd);
  static const Color foreground = Color(0xff031222);
  static const Color card = Color(0xffffffff);
  static const Color muted = Color(0xffecf3f8);
  static const Color mutedForeground = Color(0xff576574);
  static const Color borders = Color(0xffdde6ee);
  static const Color success = Color(0xff04ab62);
  static const Color warning = Color(0xfff4a437);
  static const Color destructive = Color(0xffe62b34);
  static const Color accent = Color(0xffc4ecff);
  static const Color hintBlue = Color(0xffe0f2fe);

  static const Gradient gradientPrimary = LinearGradient(
    colors: [primary, primaryGlow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradientCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff0081e7),
      Color(0xff2955d3),
    ],
  );
  static const LinearGradient gradientSoft = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      hintBlue,
      Colors.white,
    ],
  );
  static const LinearGradient gradientNavy = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0F4C9A), // fades into blue
      Color(0xFF1565C0), // middle: brightest blue
      Color(0xFF0D3F85), // lower: deeper blue
    ],
    stops: [0.18, 0.45, 1.0],
  );
}
