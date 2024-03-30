import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/components/menu.dart';
import '../controllers/home_controller.dart';

import '../../../global/components/about.dart';
import '../../../global/components/contact.dart';
import '../../../global/components/experience.dart';
import '../../../global/components/footer.dart';
import '../../../global/components/header.dart';
import '../../../global/components/hero.dart';
import '../../../global/components/skills.dart';
import '../../../global/components/testimonials.dart';
import '../../../global/components/work.dart';

class HomePage extends GetWidget<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      endDrawer: const Menu(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              HeroSection(key: controller.heroKey),
              AboutSection(key: controller.aboutKey),
              SkillsSection(key: controller.skillsKey),
              ExperienceSection(key: controller.experienceKey),
              WorkSection(key: controller.workKey),
              TestimonialsSection(key: controller.testimonialsKey),
              ContactSection(key: controller.contactKey),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
