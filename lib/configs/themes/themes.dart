import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';
import 'typography.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    textTheme: AppTypography().lightTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayLight.shade600),
  );

  static final darkTheme = ThemeData(
    textTheme: AppTypography().darkTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayDark.shade600),
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
