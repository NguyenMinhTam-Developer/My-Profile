import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../../../global/extensions/hardcode.dart';
import '../controllers/home_controller.dart';
import '../widgets/tag.dart';
import 'about_edit_bottomsheet.dart';

class AboutSection extends GetWidget<HomePageController> {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      color: AppColors.grayLight.shade50,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconButton(onPressed: null, icon: Icon(null)),
                  TagComponent(label: "About me".isHardcode),
                  IconButton(
                    onPressed: () => AboutEditBottomSheet.show(),
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Get to know me better:".isHardcode,
                style: AppTypography.headingH3SemiBold,
              ),
              const SizedBox(height: 24),
              Obx(
                () => Text(
                  controller.currentUser.value.aboutMe.isHardcode,
                  style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
