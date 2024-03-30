import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/app/global/controllers/theme_controller.dart';

import '../../../configs/themes/colors.dart';
import '../../presentation/home/controllers/home_controller.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        centerTitle: false,
        backgroundColor: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight,
          darkMode: AppColors.grayDark,
        ),
        surfaceTintColor: ThemeController.findOrInitialize.when(
          lightMode: AppColors.grayLight,
          darkMode: AppColors.grayDark,
        ),
        title: GestureDetector(
          onTap: () {
            HomePageController.findOrInitialize.navigateToSection(HomePageController.findOrInitialize.heroKey);
          },
          child: Text(
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
