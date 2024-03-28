import 'package:flutter/material.dart';

import '../../domain/entities/social_media_entity.dart';
import 'social_media_icon.dart';

class SocialMediaContact extends StatelessWidget {
  const SocialMediaContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SocialMediaPlatform> socialMediaPlatforms = [
      SocialMediaPlatform.github,
      SocialMediaPlatform.linkedin,
      SocialMediaPlatform.x,
    ];

    return Wrap(
      children: List.generate(
        socialMediaPlatforms.length,
        (index) {
          return SocialMediaIcon(
            onPressed: () {},
            platform: socialMediaPlatforms[index],
          );
        },
      ),
    );
  }
}
