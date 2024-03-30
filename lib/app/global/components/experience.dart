import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/drop_shadows.dart';
import '../../../configs/themes/typography.dart';
import '../../domain/entities/experience_entity.dart';
import '../controllers/theme_controller.dart';
import '../extensions/hardcode.dart';
import 'tag.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        color: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight.shade50,
          darkMode: AppColors.grayDark.shade50,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagComponent(label: "Experience".isHardcode),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Here is a quick summary of my most recent experiences:".isHardcode,
              textAlign: TextAlign.center,
              style: AppTypography.subtitleNormal.copyWith(
                  color: ThemeController.findOrInitialize.when(
                lightMode: AppColors.grayLight.shade600,
                darkMode: AppColors.grayDark.shade600,
              )),
            ),
            const SizedBox(height: 24),
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 24);
              },
              itemBuilder: (BuildContext context, int index) {
                return ExperienceItem(
                  ExperienceEntity(
                    company: "Company".isHardcode,
                    title: "Title".isHardcode,
                    description: "Description".isHardcode,
                    startDate: DateTime.now(),
                    endDate: DateTime.now(),
                  ),
                );
              },
            ),
          ],
        ),
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
        color: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight,
          darkMode: AppColors.grayDark.shade100,
        ),
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
                  color: ThemeController.findOrInitialize.when(
                    lightMode: AppColors.grayLight.shade200,
                    darkMode: AppColors.grayDark.shade200,
                  ),
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
            style: AppTypography.body2Medium.copyWith(
                color: ThemeController.findOrInitialize.when(
              lightMode: AppColors.grayLight.shade700,
              darkMode: AppColors.grayDark.shade700,
            )),
          ),
          const SizedBox(height: 16),
          Text(
            experience.title,
            style: AppTypography.subtitleSemiBold,
          ),
          const SizedBox(height: 16),
          Text(
            experience.description,
            style: AppTypography.body2Medium.copyWith(
              color: ThemeController.findOrInitialize.when(
                lightMode: AppColors.grayLight.shade600,
                darkMode: AppColors.grayDark.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
