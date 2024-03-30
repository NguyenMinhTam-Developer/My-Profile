import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/global/controllers/theme_controller.dart';
import 'configs/routes/route_name.dart';
import 'configs/routes/route_page.dart';
import 'configs/themes/themes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'My Profile',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        getPages: AppPage.pages,
        initialRoute: AppRoutes.home,
        initialBinding: ThemeBinding(),
      ),
    );
  }
}
