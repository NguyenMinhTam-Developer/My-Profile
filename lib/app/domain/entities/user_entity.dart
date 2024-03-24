import 'package:flutter/foundation.dart';

import 'experience_entity.dart';
import 'skills_entity.dart';
import 'social_media_entity.dart';
import 'testimonial_entity.dart';
import 'work_entity.dart';

class UserEntity {
  /// The user's avatar file path.
  final String avatar;

  /// The user's first name.
  final String firstName;

  /// The user's last name.
  final String lastName;

  /// The user's phone.
  final String phone;

  /// The user's email.
  final String email;

  /// The user's description. (e.g. "I'm a software engineer.")
  final String description;

  /// The user's location. (e.g. "Jakarta, Indonesia")
  final String location;

  final List<SocialMediaEntity> socialMedias;

  /// The user's about me.
  final String aboutMe;

  /// The user's skills.
  final List<SkillsEntity> skills;

  /// The user's experiences.
  final List<ExperienceEntity> experiences;

  /// The user's works.
  final List<WorkEntity> works;

  /// The user's testimonials.
  final List<TestimonialEntity> testimonials;

  UserEntity({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.description,
    required this.location,
    required this.socialMedias,
    required this.aboutMe,
    required this.skills,
    required this.experiences,
    required this.works,
    required this.testimonials,
  });

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'description': description,
      'location': location,
      'socialMedias': socialMedias.map((x) => x.toMap()).toList(),
      'aboutMe': aboutMe,
      'skills': skills.map((x) => x.toMap()).toList(),
      'experiences': experiences.map((x) => x.toMap()).toList(),
      'works': works.map((x) => x.toMap()).toList(),
      'testimonials': testimonials.map((x) => x.toMap()).toList(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      avatar: map['avatar'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      socialMedias: List<SocialMediaEntity>.from(map['socialMedias']?.map((x) => SocialMediaEntity.fromMap(x)) ?? const []),
      aboutMe: map['aboutMe'] ?? '',
      skills: List<SkillsEntity>.from(map['skills']?.map((x) => SkillsEntity.fromMap(x)) ?? const []),
      experiences: List<ExperienceEntity>.from(map['experiences']?.map((x) => ExperienceEntity.fromMap(x)) ?? const []),
      works: List<WorkEntity>.from(map['works']?.map((x) => WorkEntity.fromMap(x)) ?? const []),
      testimonials: List<TestimonialEntity>.from(map['testimonials']?.map((x) => TestimonialEntity.fromMap(x)) ?? const []),
    );
  }

  static UserEntity me() {
    return UserEntity(
      avatar: '',
      firstName: 'Tam',
      lastName: 'Nguyen',
      phone: '+84 338 072 985',
      email: 'nguyenminhtam.developer@gmail.com',
      description: "I am a Flutter Developer with nearly four years of experience in building cross-platform applications for mobile and web. I have a strong knowledge of the Flutter framework, Dart language, API connection, and Firebase service. I have developed and deployed many applications using Flutter to the App Store and Google Play. I am passionate about creating user-friendly, responsive, and scalable solutions that meet the needs of the clients and the users.",
      aboutMe: '''I'm a passionate, self-proclaimed programmer who specializes in mobile application development (Dart & Flutter). I am very enthusiastic about bringing the technical and visual aspects of digital products to life. User experience, pixel perfect design, and writing clear, readable, highly performant code matters to me.

I began my journey as a mobile application developer in 2020, and since then, I've continued to grow and evolve as a developer, taking on new challenges and learning the latest technologies along the way. Now, in my early twenties, 4 years after starting my mobile application development journey, I'm building cutting-edge mobile applications using modern technologies such as Flutter, Firebase, React-Native and much more.

I am very much a progressive thinker and enjoy working on products end to end, from ideation all the way to development.

When I'm not in full-on developer mode, you can find me hovering around on LinkedIn or on Facebook, witnessing the journey of early startups or enjoying some free time. You can follow me on Facebook where I share tech-related bites and build in public, or you can follow me on GitHub.

One last thing, I'm available for work, so feel free to reach out and say hello! ''',
      location: 'Vung Tau, Viet Nam',
      socialMedias: [
        SocialMediaEntity(platform: SocialMediaPlatform.github, url: 'https://github.com/NguyenMinhTam-Developer'),
        SocialMediaEntity(platform: SocialMediaPlatform.facebook, url: 'https://www.facebook.com/nguyenmingtam.developer/'),
        SocialMediaEntity(platform: SocialMediaPlatform.linkedin, url: 'https://www.linkedin.com/in/t%C3%A2m-nguy%E1%BB%85n-20802b202/'),
      ],
      skills: [
        SkillsEntity(name: "Dart"),
        SkillsEntity(name: "Flutter"),
        SkillsEntity(name: "State Management"),
        SkillsEntity(name: "Clean Architecture"),
        SkillsEntity(name: "Unit Testing"),
        SkillsEntity(name: "Git"),
        SkillsEntity(name: "Firebase"),
        SkillsEntity(name: "RESTful API"),
        SkillsEntity(name: "CI/CD"),
        SkillsEntity(name: "UI/UX Design"),
        SkillsEntity(name: "Responsive Design"),
        SkillsEntity(name: "App Distribution"),
        SkillsEntity(name: "Agile Methodology"),
        SkillsEntity(name: "Communication"),
        SkillsEntity(name: "Problem Solving"),
        SkillsEntity(name: "Teamwork"),
      ],
      experiences: [
        ExperienceEntity(
          company: "VTCO TECHNOLOGY",
          startDate: DateTime(2022, 8),
          endDate: DateTime(2023, 6),
          title: "Flutter Developer",
          description: '''• Developed and deployed cross-platform applications for mobile and web using Flutter framework and Dart language.

• Lead and cooperate a team of 5 members.

• Worked closely with the design team to create pixel-perfect UI/UX designs.
          ''',
        ),
        ExperienceEntity(
          company: "Maysoft LTD",
          startDate: DateTime(2021, 6),
          endDate: DateTime(2022, 7),
          title: "Flutter Developer",
          description: '''• Developed and deployed cross-platform applications for mobile and web using Flutter framework and Dart language.

• Integrated various APIs and Firebase services to enhance functionality and user experience

• Collaborated with a team of 5 developers using agile methodology and scrum framework.
          ''',
        ),
        ExperienceEntity(
          company: "Vuta Tech JSC",
          startDate: DateTime(2020, 1),
          endDate: DateTime(2021, 6),
          title: "Flutter Developer",
          description: '''• Completed a 3-month internship as part of the Flutter Developer Program.

• Developed and deployed cross-platform applications for mobile and web using Flutter framework and Dart language.

• Integrated various APIs and Firebase services to enhance functionality and user experience
          ''',
        ),
      ],
      works: [
        WorkEntity(
          title: "MyWIFI",
          description: "Building an Internet Provider application used by college students. Allow users to access the Wi-Fi hot-pot provided by the company",
          tags: [
            "Flutter",
            "Dart",
            "Restful API",
            "Firebase",
            "UI/UX Design",
            "FCM",
            "Deeplink",
            "Bio-metric Authentication",
          ],
          appStoreUrl: "https://apps.apple.com/vn/app/mywifi/id6451381885",
          playStoreUrl: "https://play.google.com/store/apps/details?id=com.wimeshtenologycorporation.mywifi&pli=1",
          websiteUrl: "https://mywifi.wi-mesh.com/",
        ),
        WorkEntity(
          title: "ICOOL",
          description: "A loyalty application for ICOOL customers to earn points and provide helpful information.",
          tags: [
            "Flutter",
            "Dart",
            "Restful API",
            "Firebase",
            "UI/UX Design",
            "FCM",
            "Deeplink",
            "OTP Authentication",
          ],
          appStoreUrl: "https://apps.apple.com/vn/app/icool/id1636461063?l=",
          playStoreUrl: "https://play.google.com/store/apps/details?id=vn.com.karaoke.icoolcrm&pli=1",
          websiteUrl: "https://karaoke.com.vn/",
        ),
        WorkEntity(
          title: "Active 9",
          description: "Active 9 is a mobile application that helps users to track their daily activities and provide a report to the user.",
          tags: [
            "Flutter",
            "Dart",
            "Restful API",
            "Firebase",
            "UI/UX Design",
            "FCM",
            "Social Authentication",
            "Data Analysis",
            "Ranking System",
          ],
          appStoreUrl: "https://apps.apple.com/vn/app/active-9/id6446046123",
          playStoreUrl: "https://play.google.com/store/apps/details?id=com.gotino.active9&hl=en&gl=US",
          websiteUrl: "https://karaoke.com.vn/",
        ),
      ],
      testimonials: [
        TestimonialEntity(
          quote: "Tam was a key member of our development team and played a crucial role in the success of our mobile app. Their understanding of user needs and ability to translate them into a functional and engaging app were invaluable. Tam consistently impressed me with their innovative thinking and problem-solving skills.",
          name: "Quy Nguyen",
          title: "CEO",
          company: "Vuta Tech",
        ),
        TestimonialEntity(
          quote: "I had the pleasure of working with Tam during their time at Maysoft. They are a highly motivated and results-oriented developer who consistently delivered high-quality work on time and within budget. Tam is a team player who is always willing to go the extra mile to help others.",
          name: "Y Nguyen",
          title: "CEO",
          company: "Maysoft LTD",
        ),
        TestimonialEntity(
          quote: "Tam possesses a deep understanding of Flutter development and was instrumental in building a robust and scalable mobile application for our company. They are a quick learner and adept at tackling complex technical challenges. I highly recommend Tam to any company looking for a talented and reliable Flutter developer.",
          name: "Phuoc Nguyen",
          title: "CTO",
          company: "VTCODE Technology",
        ),
      ],
    );
  }

  UserEntity copyWith({
    String? avatar,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? description,
    String? location,
    List<SocialMediaEntity>? socialMedias,
    String? aboutMe,
    List<SkillsEntity>? skills,
    List<ExperienceEntity>? experiences,
    List<WorkEntity>? works,
    List<TestimonialEntity>? testimonials,
  }) {
    return UserEntity(
      avatar: avatar ?? this.avatar,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      description: description ?? this.description,
      location: location ?? this.location,
      socialMedias: socialMedias ?? this.socialMedias,
      aboutMe: aboutMe ?? this.aboutMe,
      skills: skills ?? this.skills,
      experiences: experiences ?? this.experiences,
      works: works ?? this.works,
      testimonials: testimonials ?? this.testimonials,
    );
  }

  @override
  String toString() {
    return 'UserEntity(avatar: $avatar, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, description: $description, location: $location, socialMedias: $socialMedias, aboutMe: $aboutMe, skills: $skills, experiences: $experiences, works: $works, testimonials: $testimonials)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity && other.avatar == avatar && other.firstName == firstName && other.lastName == lastName && other.phone == phone && other.email == email && other.description == description && other.location == location && listEquals(other.socialMedias, socialMedias) && other.aboutMe == aboutMe && listEquals(other.skills, skills) && listEquals(other.experiences, experiences) && listEquals(other.works, works) && listEquals(other.testimonials, testimonials);
  }

  @override
  int get hashCode {
    return avatar.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ phone.hashCode ^ email.hashCode ^ description.hashCode ^ location.hashCode ^ socialMedias.hashCode ^ aboutMe.hashCode ^ skills.hashCode ^ experiences.hashCode ^ works.hashCode ^ testimonials.hashCode;
  }
}
