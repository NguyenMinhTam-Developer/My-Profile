import 'package:flutter/material.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/typography.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      color: AppColors.grayLight.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.copyright_rounded, size: 16),
          RichText(
            text: TextSpan(
              text: "2024 |  ",
              style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600),
              children: [
                TextSpan(
                  text: "Coded",
                  style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600),
                ),
                TextSpan(
                  text: " by Nguyễn Minh Tâm",
                  style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
