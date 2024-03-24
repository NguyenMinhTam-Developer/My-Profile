import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/drop_shadows.dart';
import '../../../../configs/themes/typography.dart';
import '../../../domain/entities/testimonial_entity.dart';
import '../../../global/extensions/hardcode.dart';
import '../controllers/home_controller.dart';
import '../widgets/tag.dart';
import 'testimonial_edit_bottomsheet.dart';

class TestimonialsSection extends GetWidget<HomePageController> {
  const TestimonialsSection({super.key});

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
              TagComponent(label: "Testimonials".isHardcode),
              IconButton(
                onPressed: () => TestimonialEditBottomSheet.show(),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Nice things people have said about me:".isHardcode,
            textAlign: TextAlign.center,
            style: AppTypography.subtitleNormal.copyWith(color: AppColors.grayLight.shade600),
          ),
          const SizedBox(height: 24),
          Obx(
            () => ListView.separated(
              itemCount: controller.currentUser.value.testimonials.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 24);
              },
              itemBuilder: (BuildContext context, int index) {
                return TestimonialItem(controller.currentUser.value.testimonials[index]);
              },
            ),
          ),
        ],
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
        color: AppColors.grayLight,
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
                color: AppColors.grayLight.shade200,
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
            style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
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
                style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
