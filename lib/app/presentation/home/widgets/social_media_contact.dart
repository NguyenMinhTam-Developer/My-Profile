import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/url_launcher.dart';
import '../controllers/home_controller.dart';
import 'social_media_icon.dart';

class SocialMediaContact extends GetWidget<HomePageController> {
  const SocialMediaContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children: List.generate(
          controller.currentUser.value.socialMedias.length,
          (index) {
            final socialMedia = controller.currentUser.value.socialMedias[index];

            return SocialMediaIcon(
              onPressed: () => UrlLauncherService.launchHttps(url: socialMedia.url),
              platform: socialMedia.platform,
            );
          },
        ),
      ),
    );
  }
}
