enum SocialMediaPlatform {
  apple,
  clubhouse,
  discord,
  dribbble,
  facebook,
  figma,
  github,
  google,
  instagram,
  linkedin,
  medium,
  messenger,
  pinterest,
  reddit,
  signal,
  snapchat,
  spotify,
  telegram,
  threads,
  tiktok,
  tumblr,
  twitch,
  vk,
  whatsapp,
  x,
  youtube;

  factory SocialMediaPlatform.fromName(String name) {
    switch (name) {
      case 'apple':
        return SocialMediaPlatform.apple;
      case 'clubhouse':
        return SocialMediaPlatform.clubhouse;
      case 'discord':
        return SocialMediaPlatform.discord;
      case 'dribbble':
        return SocialMediaPlatform.dribbble;
      case 'facebook':
        return SocialMediaPlatform.facebook;
      case 'figma':
        return SocialMediaPlatform.figma;
      case 'github':
        return SocialMediaPlatform.github;
      case 'google':
        return SocialMediaPlatform.google;
      case 'instagram':
        return SocialMediaPlatform.instagram;
      case 'linkedin':
        return SocialMediaPlatform.linkedin;
      case 'medium':
        return SocialMediaPlatform.medium;
      case 'messenger':
        return SocialMediaPlatform.messenger;
      case 'pinterest':
        return SocialMediaPlatform.pinterest;
      case 'reddit':
        return SocialMediaPlatform.reddit;
      case 'signal':
        return SocialMediaPlatform.signal;
      case 'snapchat':
        return SocialMediaPlatform.snapchat;
      case 'spotify':
        return SocialMediaPlatform.spotify;
      case 'telegram':
        return SocialMediaPlatform.telegram;
      case 'threads':
        return SocialMediaPlatform.threads;
      case 'tiktok':
        return SocialMediaPlatform.tiktok;
      case 'tumblr':
        return SocialMediaPlatform.tumblr;
      case 'twitch':
        return SocialMediaPlatform.twitch;
      case 'vk':
        return SocialMediaPlatform.vk;
      case 'whatsapp':
        return SocialMediaPlatform.whatsapp;
      case 'x':
        return SocialMediaPlatform.x;
      case 'youtube':
        return SocialMediaPlatform.youtube;
      default:
        return SocialMediaPlatform.x;
    }
  }
}

class SocialMediaEntity {
  final SocialMediaPlatform platform;
  final String url;

  SocialMediaEntity({
    required this.platform,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'platform': platform.name,
      'url': url,
    };
  }

  factory SocialMediaEntity.fromMap(Map<String, dynamic> map) {
    return SocialMediaEntity(
      platform: SocialMediaPlatform.fromName(map['platform']),
      url: map['url'] ?? '',
    );
  }
}
