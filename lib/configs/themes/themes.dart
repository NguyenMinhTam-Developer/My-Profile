import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';
import 'typography.dart';

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: AppTypography().lightTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayLight.shade600),
    dividerTheme: DividerThemeData(space: 1, color: AppColors.grayLight.shade100, thickness: 1),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: AppTypography().darkTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayDark.shade600),
    dividerTheme: DividerThemeData(space: 1, color: AppColors.grayDark.shade100, thickness: 1),
  );

  static T when<T>({
    required T lightMode,
    required T darkMode,
  }) {
    if (Get.isDarkMode) {
      return darkMode;
    } else {
      return lightMode;
    }
  }
}
