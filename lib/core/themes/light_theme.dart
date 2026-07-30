export 'light_theme.dart';

import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: AppConstants.fontFamily,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.light(
    surface: AppColors.background,
  ),
);