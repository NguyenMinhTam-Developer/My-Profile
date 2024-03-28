import 'package:flutter/material.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/themes.dart';
import '../../../configs/themes/typography.dart';

class TagComponent extends StatelessWidget {
  const TagComponent({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppThemes.when(
          lightMode: AppColors.grayLight.shade200,
          darkMode: AppColors.grayDark.shade200,
        ),
      ),
      child: Text(
        label,
        style: AppTypography.body3Medium.copyWith(
          color: AppThemes.when(
            lightMode: AppColors.grayLight.shade600,
            darkMode: AppColors.grayDark.shade600,
          ),
        ),
      ),
    );
  }
}
