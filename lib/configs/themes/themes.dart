import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';
import 'typography.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    textTheme: AppTypography().lightTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayLight.shade600),
    dividerTheme: DividerThemeData(space: 1, color: AppColors.grayLight.shade100, thickness: 1),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 6)),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.grayLight.shade800;
            }

            if (states.contains(MaterialState.hovered)) {
              return AppColors.grayLight.shade700;
            }

            return AppColors.grayLight.shade900;
          },
        ),
      ),
    ),
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
