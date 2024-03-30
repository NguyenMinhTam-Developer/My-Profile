import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/app/global/controllers/theme_controller.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/typography.dart';
import 'picture_frame.dart';
import 'social_media_contact.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        color: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight,
          darkMode: AppColors.grayDark,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PictureFrameWidget(
              width: 280,
              height: 300,
              frameColor: ThemeController.findOrInitialize.when(
                lightMode: AppColors.grayLight,
                darkMode: AppColors.grayDark,
              ),
            ),
            const SizedBox(height: 48),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Hi, I'm Tâm 👋",
                    style: AppTypography.headingH1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "I'm a Flutter Developer with 2 years of experience in building mobile applications for both iOS and Android platforms.",
              style: AppTypography.body2Normal.copyWith(
                  color: ThemeController.findOrInitialize.when(
                lightMode: AppColors.grayLight.shade600,
                darkMode: AppColors.grayDark.shade600,
              )),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.place_outlined),
                const SizedBox(width: 8),
                Text(
                  "Vung Tau, Vietnam",
                  style: AppTypography.body2Normal.copyWith(
                    color: ThemeController.findOrInitialize.when(
                      lightMode: AppColors.grayLight.shade600,
                      darkMode: AppColors.grayDark.shade600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Center(
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF10B981),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Available for new projects",
                  style: AppTypography.body2Normal.copyWith(
                    color: ThemeController.findOrInitialize.when(
                      lightMode: AppColors.grayLight.shade600,
                      darkMode: AppColors.grayDark.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 48),
        const SocialMediaContact(),
      ],
    );
  }
}
