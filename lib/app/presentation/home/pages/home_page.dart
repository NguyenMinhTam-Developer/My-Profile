import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../configs/routes/route_name.dart';
import '../components/about.dart';
import '../components/contact.dart';
import '../components/experience.dart';
import '../components/footer.dart';
import '../components/hero.dart';
import '../components/skills.dart';
import '../components/testimonials.dart';
import '../components/work.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetWidget<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.refreshUser();
            },
            tooltip: "Refresh user data to original",
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () async {
              final GetStorage storage = GetStorage();

              await storage.write('rememberMe', false);

              Get.offAllNamed(AppRoutes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SingleChildScrollView(
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
        );
      }),
    );
  }
}
