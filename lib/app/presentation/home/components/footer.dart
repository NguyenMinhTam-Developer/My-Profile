import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../services/url_launcher.dart';
import '../../../../configs/themes/typography.dart';

import '../../../../configs/themes/colors.dart';

class FooterSection extends GetWidget<HomePageController> {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      color: AppColors.grayLight.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.copyright_rounded, size: 16),
          Obx(
            () => RichText(
              text: TextSpan(
                text: "2024 |  ",
                style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600),
                children: [
                  TextSpan(
                    text: "Coded",
                    style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () => UrlLauncherService.launchHttps(url: "https://github.com/NguyenMinhTam-Developer/My-Profile"),
                  ),
                  TextSpan(
                    text: " by ${controller.currentUser.value.firstName} ${controller.currentUser.value.lastName}",
                    style: AppTypography.body3Normal.copyWith(color: AppColors.grayLight.shade600),
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
