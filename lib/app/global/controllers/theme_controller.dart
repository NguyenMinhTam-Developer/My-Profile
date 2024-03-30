import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> currentThemeMode = ThemeMode.system.obs;

  void changeThemeMode() {
    var newThemeMode = currentThemeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    Get.changeThemeMode(newThemeMode);
    currentThemeMode.value = newThemeMode;
  }

  T when<T>({
    required T lightMode,
    required T darkMode,
  }) {
    if (currentThemeMode.value == ThemeMode.dark) {
      return darkMode;
    } else {
      return lightMode;
    }
  }

  static ThemeController get findOrInitialize {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(ThemeController(), permanent: true);
    }
  }
}

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(), permanent: true);
  }
}
