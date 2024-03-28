import 'package:flutter/material.dart';

import '../../../configs/themes/colors.dart';
import '../../../configs/themes/typography.dart';
import '../extensions/hardcode.dart';
import 'tag.dart';

class AboutSection extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TagComponent(label: "About me".isHardcode),
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
              Text(
                "I'm a paragraph. Click here to add your own text and edit me. It's easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. Feel free to drag and drop me anywhere you like on your page. I’m a great place for you to tell a story and let your users know a little more about you.".isHardcode,
                style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
              ),
            ],
          )
        ],
      ),
    );
  }
}