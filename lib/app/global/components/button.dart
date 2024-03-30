import 'package:flutter/material.dart';

import '../../../configs/themes/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.label,
    this.themeMode = ThemeMode.system,
  });

  final String label;
  final Function()? onPressed;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    Color defaultBackgroundColor;
    Color hoverBackgroundColor;
    Color activeBackgroundColor;
    Color defaultForegroundColor;

    switch (themeMode) {
      case ThemeMode.light:
        defaultBackgroundColor = AppColors.grayLight.shade900;
        hoverBackgroundColor = AppColors.grayLight.shade700;
        activeBackgroundColor = AppColors.grayLight.shade800;
        defaultForegroundColor = AppColors.grayLight.shade50;
        break;
      case ThemeMode.dark:
        defaultBackgroundColor = AppColors.grayDark.shade900;
        hoverBackgroundColor = AppColors.grayDark.shade700;
        activeBackgroundColor = AppColors.grayDark.shade800;
        defaultForegroundColor = AppColors.grayDark.shade50;
        break;
      case ThemeMode.system:
        defaultBackgroundColor = AppColors.grayLight.shade900;
        hoverBackgroundColor = AppColors.grayLight.shade700;
        activeBackgroundColor = AppColors.grayLight.shade800;
        defaultForegroundColor = AppColors.grayLight.shade50;
        break;
    }

    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 6)),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return activeBackgroundColor;
            }

            if (states.contains(MaterialState.hovered)) {
              return hoverBackgroundColor;
            }

            return defaultBackgroundColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return defaultForegroundColor;
          },
        ),
      ),
      child: Text(label),
    );
  }
}
