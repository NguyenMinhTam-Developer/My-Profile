import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentation/home/controllers/home_controller.dart';
import 'button.dart';
import 'menu_link.dart';
import '../controllers/theme_controller.dart';
import '../../../configs/themes/colors.dart';
import '../../../configs/themes/drop_shadows.dart';
import '../../../configs/themes/typography.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 320,
        decoration: BoxDecoration(boxShadow: AppDropShadows.xxl),
        height: double.infinity,
        child: Drawer(
          elevation: 0,
          shape: const RoundedRectangleBorder(),
          surfaceTintColor: ThemeController.findOrInitialize.when(
            lightMode: AppColors.grayLight,
            darkMode: AppColors.grayDark,
          ),
          backgroundColor: ThemeController.findOrInitialize.when(
            lightMode: AppColors.grayLight,
            darkMode: AppColors.grayDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: ThemeController.findOrInitialize.when(
                  lightMode: AppColors.grayLight,
                  darkMode: AppColors.grayDark,
                ),
                surfaceTintColor: ThemeController.findOrInitialize.when(
                  lightMode: AppColors.grayLight,
                  darkMode: AppColors.grayDark,
                ),
                title: Text(
                  "<TM />",
                  style: TextStyle(
                    fontSize: 30,
                    color: ThemeController.findOrInitialize.when(
                      lightMode: AppColors.grayLight.shade800,
                      darkMode: AppColors.grayDark.shade800,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuLink(
                      onTap: () => navigateToSection(HomePageController.findOrInitialize.aboutKey),
                      title: "About",
                      themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                    ),
                    const SizedBox(height: 16),
                    MenuLink(
                      onTap: () => navigateToSection(HomePageController.findOrInitialize.skillsKey),
                      title: "Skills",
                      themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                    ),
                    const SizedBox(height: 16),
                    MenuLink(
                      onTap: () => navigateToSection(HomePageController.findOrInitialize.experienceKey),
                      title: "Experiences",
                      themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                    ),
                    const SizedBox(height: 16),
                    MenuLink(
                      onTap: () => navigateToSection(HomePageController.findOrInitialize.workKey),
                      title: "Work",
                      themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                    ),
                    const SizedBox(height: 16),
                    MenuLink(
                      onTap: () => navigateToSection(HomePageController.findOrInitialize.testimonialsKey),
                      title: "Testimonials",
                      themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                    ),
                    const SizedBox(height: 16),
                    MenuLink(
                      onTap: () => navigateToSection(HomePageController.findOrInitialize.contactKey),
                      title: "Contact",
                      themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(16).copyWith(right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Switch Theme",
                            style: AppTypography.body2Normal.copyWith(
                              color: ThemeController.findOrInitialize.when(
                                lightMode: AppColors.grayLight.shade600,
                                darkMode: AppColors.grayDark.shade600,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ThemeController.findOrInitialize.changeThemeMode();
                          },
                          icon: Icon(
                            ThemeController.findOrInitialize.when(
                              lightMode: Icons.light_mode_outlined,
                              darkMode: Icons.dark_mode_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Button(
                        onPressed: () {},
                        label: "Download CV",
                        themeMode: ThemeController.findOrInitialize.currentThemeMode.value,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSection(GlobalKey key) {
    Get.back();
    HomePageController.findOrInitialize.navigateToSection(key);
  }
}
