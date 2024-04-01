import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/themes.dart';
import '../../../domain/entities/social_media_entity.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    required this.onPressed,
    required this.platform,
    super.key,
    this.size = 24,
  });

  final SocialMediaPlatform platform;
  final Function()? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        _getPlatformIcon(),
        height: size,
        width: size,
        colorFilter: ColorFilter.mode(
            AppThemes.when(
              lightMode: AppColors.grayLight.shade600,
              darkMode: AppColors.grayDark.shade600,
            ),
            BlendMode.srcIn),
      ),
    );
  }

  String _getPlatformIcon() {
    switch (platform) {
      case SocialMediaPlatform.apple:
        return 'assets/social_media/ic_apple.svg';
      case SocialMediaPlatform.clubhouse:
        return 'assets/social_media/ic_clubhouse.svg';
      case SocialMediaPlatform.discord:
        return 'assets/social_media/ic_discord.svg';
      case SocialMediaPlatform.dribbble:
        return 'assets/social_media/ic_dribbble.svg';
      case SocialMediaPlatform.facebook:
        return 'assets/social_media/ic_facebook.svg';
      case SocialMediaPlatform.figma:
        return 'assets/social_media/ic_figma.svg';
      case SocialMediaPlatform.github:
        return 'assets/social_media/ic_github.svg';
      case SocialMediaPlatform.google:
        return 'assets/social_media/ic_google.svg';
      case SocialMediaPlatform.instagram:
        return 'assets/social_media/ic_instagram.svg';
      case SocialMediaPlatform.linkedin:
        return 'assets/social_media/ic_linkedin.svg';
      case SocialMediaPlatform.medium:
        return 'assets/social_media/ic_medium.svg';
      case SocialMediaPlatform.messenger:
        return 'assets/social_media/ic_messenger.svg';
      case SocialMediaPlatform.pinterest:
        return 'assets/social_media/ic_pinterest.svg';
      case SocialMediaPlatform.reddit:
        return 'assets/social_media/ic_reddit.svg';
      case SocialMediaPlatform.signal:
        return 'assets/social_media/ic_signal.svg';
      case SocialMediaPlatform.snapchat:
        return 'assets/social_media/ic_snapchat.svg';
      case SocialMediaPlatform.spotify:
        return 'assets/social_media/ic_spotify.svg';
      case SocialMediaPlatform.telegram:
        return 'assets/social_media/ic_telegram.svg';
      case SocialMediaPlatform.threads:
        return 'assets/social_media/ic_threads.svg';
      case SocialMediaPlatform.tiktok:
        return 'assets/social_media/ic_tiktok.svg';
      case SocialMediaPlatform.tumblr:
        return 'assets/social_media/ic_tumblr.svg';
      case SocialMediaPlatform.twitch:
        return 'assets/social_media/ic_twitch.svg';
      case SocialMediaPlatform.vk:
        return 'assets/social_media/ic_vk.svg';
      case SocialMediaPlatform.whatsapp:
        return 'assets/social_media/ic_whatsapp.svg';
      case SocialMediaPlatform.x:
        return 'assets/social_media/ic_x.svg';
      case SocialMediaPlatform.youtube:
        return 'assets/social_media/ic_youtube.svg';
    }
  }
}
