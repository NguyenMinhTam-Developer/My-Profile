import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../../../global/extensions/hardcode.dart';
import '../controllers/home_controller.dart';
import '../widgets/tag.dart';
import 'skills_edit_bottomsheet.dart';

class SkillsSection extends GetWidget<HomePageController> {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      color: AppColors.grayLight,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(onPressed: null, icon: Icon(null)),
              TagComponent(label: "Skills".isHardcode),
              IconButton(
                onPressed: () => SkillsEditBottomSheet.show(),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "The skills, tools and technologies I am really good at:".isHardcode,
            textAlign: TextAlign.center,
            style: AppTypography.subtitleNormal.copyWith(color: AppColors.grayLight.shade600),
          ),
          const SizedBox(height: 24),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.currentUser.value.skills.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1 / 1.15,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: AppColors.grayLight.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.verified,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Text(
                        controller.currentUser.value.skills[index].name,
                        textAlign: TextAlign.center,
                        style: AppTypography.body1Normal.copyWith(color: AppColors.grayLight.shade600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
