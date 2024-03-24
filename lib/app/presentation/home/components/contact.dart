import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';
import '../../../global/extensions/hardcode.dart';
import '../widgets/social_media_contact.dart';
import '../widgets/tag.dart';

class ContactSection extends GetWidget<HomePageController> {
  const ContactSection({super.key});

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
              TagComponent(label: "Get in touch".isHardcode),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "What's next? Feel free to reach out to me if you're looking for a developer, have a query, or simply want to connect.".isHardcode,
            textAlign: TextAlign.center,
            style: AppTypography.subtitleNormal.copyWith(color: AppColors.grayLight.shade600),
          ),
          const SizedBox(height: 24),
          Obx(
            () => Column(
              children: [
                ContactItem(
                  icon: Icons.email_outlined,
                  text: controller.currentUser.value.email.isHardcode,
                  clipboardText: "Email copied to clipboard".isHardcode,
                ),
                ContactItem(
                  icon: Icons.phone_outlined,
                  text: controller.currentUser.value.phone.isHardcode,
                  clipboardText: "Phone number copied to clipboard".isHardcode,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text(
                "You may also find me on these platforms!".isHardcode,
                textAlign: TextAlign.center,
                style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
              ),
              const SizedBox(height: 8),
              const SocialMediaContact(),
            ],
          )
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.icon,
    required this.text,
    required this.clipboardText,
  });

  final IconData icon;
  final String text;
  final String clipboardText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            text,
            style: AppTypography.body2SemiBold,
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();

            Clipboard.setData(ClipboardData(text: text));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(clipboardText),
              ),
            );
          },
          child: const SizedBox(
            height: 36,
            child: Icon(Icons.copy_outlined),
          ),
        ),
      ],
    );
  }
}
