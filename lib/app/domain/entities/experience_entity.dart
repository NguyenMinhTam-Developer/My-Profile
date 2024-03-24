class ExperienceEntity {
  final String title;
  final String company;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;

  ExperienceEntity({
    required this.title,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'company': company,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory ExperienceEntity.fromMap(Map<String, dynamic> map) {
    return ExperienceEntity(
      title: map['title'] ?? '',
      company: map['company'] ?? '',
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: map['endDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endDate']) : null,
      description: map['description'] ?? '',
    );
  }
}
