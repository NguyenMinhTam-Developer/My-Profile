import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/drop_shadows.dart';
import '../../../configs/themes/typography.dart';
import '../../domain/entities/work_entity.dart';
import '../../services/url_launcher.dart';
import '../extensions/hardcode.dart';
import 'tag.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      color: AppColors.grayLight,
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
            style: AppTypography.subtitleNormal.copyWith(color: AppColors.grayLight.shade600),
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
    );
  }
}

class WorkItem extends StatelessWidget {
  const WorkItem(this.work, {super.key});

  final WorkEntity work;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.grayLight,
        boxShadow: AppDropShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.grayLight.shade50,
              border: Border(bottom: BorderSide(color: AppColors.grayLight.shade100, width: 1)),
            ),
            child: Container(
              height: 192,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.grayLight.shade200,
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
                  style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    if (work.appStoreUrl != null)
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/tech_stack/ic_app_store.svg",
                          colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                          height: 24,
                          width: 24,
                        ),
                      ),
                    if (work.playStoreUrl != null)
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/tech_stack/ic_google_play.svg",
                          colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                          height: 24,
                          width: 24,
                        ),
                      ),
                    if (work.websiteUrl != null)
                      IconButton(
                        onPressed: () => UrlLauncherService.launchHttps(url: work.websiteUrl!),
                        icon: const Icon(Icons.link_rounded),
                      ),
                  ],
                ),
                // const SizedBox(height: 24),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: List.generate(
                //     work.tags.length,
                //     (index) => TagComponent(
                //       label: work.tags[index],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
