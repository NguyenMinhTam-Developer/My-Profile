import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/drop_shadows.dart';
import '../../../configs/themes/typography.dart';
import '../../domain/entities/testimonial_entity.dart';
import '../controllers/theme_controller.dart';
import '../extensions/hardcode.dart';
import 'tag.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
                TagComponent(label: "Testimonials".isHardcode),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Nice things people have said about me:".isHardcode,
              textAlign: TextAlign.center,
              style: AppTypography.subtitleNormal.copyWith(
                color: ThemeController.findOrInitialize.when(
                  lightMode: AppColors.grayLight.shade600,
                  darkMode: AppColors.grayDark.shade600,
                ),
              ),
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
                return TestimonialItem(
                  TestimonialEntity(
                    name: "John Doe",
                    title: "CEO",
                    company: "Company",
                    quote: "I'm a testimonial quote. Click here to edit me and add your own testimonial.",
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

class TestimonialItem extends StatelessWidget {
  const TestimonialItem(this.testimonial, {super.key});

  final TestimonialEntity testimonial;

  @override
  Widget build(BuildContext context) {
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
          Align(
            child: Container(
              height: 64,
              width: 64,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeController.findOrInitialize.when(
                  lightMode: AppColors.grayLight.shade200,
                  darkMode: AppColors.grayDark.shade200,
                ),
              ),
              child: const Icon(
                Icons.sentiment_very_satisfied_outlined,
                size: 32,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "“${testimonial.quote}”",
            textAlign: TextAlign.center,
            style: AppTypography.body2Normal.copyWith(
              color: ThemeController.findOrInitialize.when(
                lightMode: AppColors.grayLight.shade600,
                darkMode: AppColors.grayDark.shade600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Text(
                testimonial.name,
                textAlign: TextAlign.center,
                style: AppTypography.subtitleSemiBold,
              ),
              const SizedBox(height: 4),
              Text(
                "${testimonial.title} at ${testimonial.company}",
                textAlign: TextAlign.center,
                style: AppTypography.body3Normal.copyWith(
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
    );
  }
}
