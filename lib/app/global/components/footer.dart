import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/typography.dart';
import '../controllers/theme_controller.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        color: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight.shade50,
          darkMode: AppColors.grayDark.shade50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.copyright_rounded, size: 16),
            RichText(
              text: TextSpan(
                text: " 2024 |  ",
                style: AppTypography.body3Normal.copyWith(
                  color: ThemeController.findOrInitialize.when(
                    lightMode: AppColors.grayLight.shade600,
                    darkMode: AppColors.grayDark.shade600,
                  ),
                ),
                children: [
                  TextSpan(
                    text: "Coded",
                    style: AppTypography.body3Normal.copyWith(
                      color: ThemeController.findOrInitialize.when(
                        lightMode: AppColors.grayLight.shade600,
                        darkMode: AppColors.grayDark.shade600,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " by Nguyễn Minh Tâm",
                    style: AppTypography.body3Normal.copyWith(
                      color: ThemeController.findOrInitialize.when(
                        lightMode: AppColors.grayLight.shade600,
                        darkMode: AppColors.grayDark.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
