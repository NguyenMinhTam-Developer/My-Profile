import 'package:flutter/material.dart';
import 'package:my_profile/configs/themes/colors.dart';
import 'package:my_profile/configs/themes/typography.dart';

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: AppTypography().lightTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayLight.shade600),
    drawerTheme: DrawerThemeData(
      scrimColor: AppColors.grayLight.shade900.withOpacity(0.1),
    ),
    dividerTheme: DividerThemeData(space: 1, color: AppColors.grayLight.shade100, thickness: 1),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: AppTypography().darkTextTheme,
    iconTheme: IconThemeData(color: AppColors.grayDark.shade600),
    dividerTheme: DividerThemeData(space: 1, color: AppColors.grayDark.shade100, thickness: 1),
    drawerTheme: DrawerThemeData(
      scrimColor: AppColors.grayDark.shade900.withOpacity(0.1),
    ),
  );
}
