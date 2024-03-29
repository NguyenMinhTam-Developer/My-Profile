import 'package:flutter/material.dart';
import 'package:my_profile/configs/themes/themes.dart';
import 'package:my_profile/configs/themes/typography.dart';

import '../../../configs/themes/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
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
              return AppColors.grayLight.shade800;
            }

            if (states.contains(MaterialState.hovered)) {
              return AppColors.grayLight.shade700;
            }

            return AppColors.grayLight.shade900;
          },
        ),
      ),
      child: Text(
        label,
        style: AppTypography.body2Normal.copyWith(
          color: AppThemes.when(
            lightMode: AppColors.grayLight.shade50,
            darkMode: AppColors.grayDark.shade50,
          ),
        ),
      ),
    );
  }
}
