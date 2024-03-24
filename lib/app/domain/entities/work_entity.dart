class WorkEntity {
  final String title;
  final String description;
  final List<String> tags;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? websiteUrl;

  WorkEntity({
    required this.title,
    required this.description,
    required this.tags,
    required this.appStoreUrl,
    required this.playStoreUrl,
    required this.websiteUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'tags': tags,
      'appStoreUrl': appStoreUrl,
      'playStoreUrl': playStoreUrl,
      'websiteUrl': websiteUrl,
    };
  }

  factory WorkEntity.fromMap(Map<String, dynamic> map) {
    return WorkEntity(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      tags: List<String>.from(map['tags'] ?? const []),
      appStoreUrl: map['appStoreUrl'],
      playStoreUrl: map['playStoreUrl'],
      websiteUrl: map['websiteUrl'],
    );
  }
}
