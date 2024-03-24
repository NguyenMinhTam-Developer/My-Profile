import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';

import '../controllers/home_controller.dart';
import '../widgets/picture_frame.dart';
import '../widgets/social_media_contact.dart';
import 'hero_edit_bottomsheet.dart';

class HeroSection extends GetWidget<HomePageController> {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      color: AppColors.grayLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => PictureFrameWidget(
              width: 280,
              height: 300,
              imagePath: controller.currentUser.value.avatar,
              onImageChange: (imagePath) => controller.updateUserAvatar(imagePath),
            ),
          ),
          const SizedBox(height: 48),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hi, I'm ${controller.currentUser.value.firstName} 👋",
                      style: AppTypography.headingH1,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () => HeroEditBottomSheet.show(),
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                controller.currentUser.value.description,
                style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
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
                    controller.currentUser.value.location,
                    style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
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
                    style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          const SocialMediaContact(),
        ],
      ),
    );
  }
}
