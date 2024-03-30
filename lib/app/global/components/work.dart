import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/drop_shadows.dart';
import '../../../configs/themes/typography.dart';
import '../../domain/entities/work_entity.dart';
import '../controllers/theme_controller.dart';
import '../extensions/hardcode.dart';
import 'tag.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagComponent(label: "Work".isHardcode),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Some of the noteworthy projects I have built:".isHardcode,
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
                return WorkItem(
                  WorkEntity(
                    title: "Project Title",
                    description: "I'm a project description. Click here to edit me.",
                    appStoreUrl: null,
                    playStoreUrl: null,
                    websiteUrl: null,
                    tags: ["Flutter", "Dart"],
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

class WorkItem extends StatelessWidget {
  const WorkItem(this.work, {super.key});

  final WorkEntity work;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight,
          darkMode: AppColors.grayDark.shade100,
        ),
        boxShadow: AppDropShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: ThemeController.findOrInitialize.when(
                lightMode: AppColors.grayLight.shade200,
                darkMode: AppColors.grayDark.shade200,
              ),
              border: Border(
                bottom: BorderSide(
                  color: ThemeController.findOrInitialize.when(
                    lightMode: AppColors.grayLight.shade100,
                    darkMode: AppColors.grayDark.shade100,
                  ),
                  width: 1,
                ),
              ),
            ),
            child: Container(
              height: 192,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeController.findOrInitialize.when(
                  lightMode: AppColors.grayLight.shade300,
                  darkMode: AppColors.grayDark.shade300,
                ),
                boxShadow: AppDropShadows.lg,
              ),
              child: const Icon(Icons.mobile_friendly_rounded, size: 64),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  work.title,
                  style: AppTypography.subtitleSemiBold,
                ),
                const SizedBox(height: 24),
                Text(
                  work.description,
                  style: AppTypography.body2Normal.copyWith(
                    color: ThemeController.findOrInitialize.when(
                      lightMode: AppColors.grayLight.shade600,
                      darkMode: AppColors.grayDark.shade600,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
