import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/app/global/components/menu.dart';
import 'package:my_profile/app/presentation/home/controllers/home_controller.dart';
import '../../../../configs/themes/colors.dart';

import '../../../global/components/about.dart';
import '../../../global/components/contact.dart';
import '../../../global/components/experience.dart';
import '../../../global/components/footer.dart';
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
      drawerScrimColor: AppColors.grayLight.shade900.withOpacity(0.1),
      endDrawer: const Menu(),
      body: const SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              HeroSection(),
              AboutSection(),
              SkillsSection(),
              ExperienceSection(),
              WorkSection(),
              TestimonialsSection(),
              ContactSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.grayLight,
      surfaceTintColor: AppColors.grayLight,
      title: Text(
        "<TM />",
        style: TextStyle(
          fontSize: 30,
          color: AppColors.grayLight.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
