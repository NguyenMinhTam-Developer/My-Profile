import 'package:flutter/material.dart';
import 'package:my_profile/app/global/components/menu_link.dart';
import 'package:my_profile/configs/themes/colors.dart';
import 'package:my_profile/configs/themes/drop_shadows.dart';
import 'package:my_profile/configs/themes/themes.dart';
import 'package:my_profile/configs/themes/typography.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(boxShadow: AppDropShadows.xxl),
      height: double.infinity,
      child: Drawer(
        elevation: 0,
        shadowColor: Colors.yellow,
        shape: const RoundedRectangleBorder(),
        surfaceTintColor: AppColors.grayLight,
        backgroundColor: AppColors.grayLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
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
                    onTap: () {},
                    title: "About",
                  ),
                  const SizedBox(height: 16),
                  MenuLink(
                    onTap: () {},
                    title: "Work",
                  ),
                  const SizedBox(height: 16),
                  MenuLink(
                    onTap: () {},
                    title: "Testimonials",
                  ),
                  const SizedBox(height: 16),
                  MenuLink(
                    onTap: () {},
                    title: "Contact",
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Switch Theme",
                          style: AppTypography.body2Normal.copyWith(color: AppColors.grayLight.shade600),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(AppThemes.when(lightMode: Icons.light_mode_outlined, darkMode: Icons.dark_mode_outlined)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Placeholder(
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text("Download CV"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
