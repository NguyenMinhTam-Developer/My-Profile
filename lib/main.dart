import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'configs/routes/route_name.dart';
import 'configs/routes/route_page.dart';
import 'configs/themes/themes.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool rememberMe;

  @override
  void initState() {
    super.initState();

    final GetStorage storage = GetStorage();

    rememberMe = storage.read('rememberMe') ?? false;
  }

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
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        getPages: AppPage.pages,
        initialRoute: rememberMe == false ? AppRoutes.login : AppRoutes.home,
      ),
    );
  }
}
