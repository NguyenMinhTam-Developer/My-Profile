import 'package:flutter/material.dart';
import '../../../configs/themes/colors.dart';
import '../../../configs/themes/typography.dart';

class MenuLink extends StatelessWidget {
  const MenuLink({
    super.key,
    required this.onTap,
    required this.title,
    this.themeMode = ThemeMode.system,
  });

  final VoidCallback onTap;
  final String title;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    Color hoverColor;
    Color defaultColor;

    switch (themeMode) {
      case ThemeMode.light:
        hoverColor = AppColors.grayLight.shade900;
        defaultColor = AppColors.grayLight.shade600;
        break;
      case ThemeMode.dark:
        hoverColor = AppColors.grayDark.shade900;
        defaultColor = AppColors.grayDark.shade600;
        break;
      case ThemeMode.system:
        hoverColor = AppColors.grayLight.shade900;
        defaultColor = AppColors.grayLight.shade600;
        break;
    }

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all(Size.zero),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return hoverColor;
            }

            return defaultColor;
          },
        ),
      ),
      child: Text(
        title,
        style: AppTypography.body2Medium,
      ),
    );
  }
}
