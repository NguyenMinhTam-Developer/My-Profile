class SkillsEntity {
  final String name;

  SkillsEntity({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory SkillsEntity.fromMap(Map<String, dynamic> map) {
    return SkillsEntity(
      name: map['name'] ?? '',
    );
  }
}
