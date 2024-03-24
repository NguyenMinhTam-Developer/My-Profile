import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/drop_shadows.dart';
import '../../../../configs/themes/typography.dart';
import '../../../domain/entities/experience_entity.dart';
import '../../../global/extensions/hardcode.dart';
import '../controllers/home_controller.dart';
import '../widgets/tag.dart';
import 'experience_edit_bottomsheet.dart';

class ExperienceSection extends GetWidget<HomePageController> {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      color: AppColors.grayLight.shade50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(onPressed: null, icon: Icon(null)),
              TagComponent(label: "Experience".isHardcode),
              IconButton(
                onPressed: () => ExperienceEditBottomSheet.show(),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Here is a quick summary of my most recent experiences:".isHardcode,
            textAlign: TextAlign.center,
            style: AppTypography.subtitleNormal.copyWith(color: AppColors.grayLight.shade600),
          ),
          const SizedBox(height: 24),
          Obx(
            () => ListView.separated(
              itemCount: controller.currentUser.value.experiences.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 24);
              },
              itemBuilder: (BuildContext context, int index) {
                return ExperienceItem(controller.currentUser.value.experiences[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  const ExperienceItem(
    this.experience, {
    super.key,
  });

  final ExperienceEntity experience;

  @override
  Widget build(BuildContext context) {
    String startDate = DateFormat("MMM yyyy").format(experience.startDate);
    String endDate = experience.endDate != null ? DateFormat("MMM yyyy").format(experience.endDate!) : "Present";

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.grayLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppDropShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: AppColors.grayLight.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.work_rounded,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            experience.company,
            style: AppTypography.subtitleSemiBold,
          ),
          const SizedBox(height: 8),
          Text(
            "$startDate - $endDate",
            style: AppTypography.body2Medium.copyWith(color: AppColors.grayLight.shade700),
          ),
          const SizedBox(height: 16),
          Text(
            experience.title,
            style: AppTypography.subtitleSemiBold,
          ),
          const SizedBox(height: 16),
          Text(
            experience.description,
            style: AppTypography.body2Medium.copyWith(color: AppColors.grayLight.shade600),
          ),
        ],
      ),
    );
  }
}
