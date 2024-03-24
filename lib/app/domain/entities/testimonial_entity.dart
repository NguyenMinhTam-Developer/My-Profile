class TestimonialEntity {
  final String quote;
  final String name;
  final String title;
  final String company;

  TestimonialEntity({
    required this.quote,
    required this.name,
    required this.title,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'name': name,
      'title': title,
      'company': company,
    };
  }

  factory TestimonialEntity.fromMap(Map<String, dynamic> map) {
    return TestimonialEntity(
      quote: map['quote'] ?? '',
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      company: map['company'] ?? '',
    );
  }
}
