import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData themeDataLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primary.color,
      primary: AppColors.primary.color,
      secondary: AppColors.secondary.color),
  fontFamily: 'Poppins',
);

final ThemeData themeDataDark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary.color,
      primary: AppColors.primary.color,
      secondary: AppColors.secondary.color),
  fontFamily: 'Poppins',
);
