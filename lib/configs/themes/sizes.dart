import 'package:get/get.dart';

class AppScreenSizes {
  AppScreenSizes();

  bool get desktop => Get.size.width >= 1024;

  bool get table => Get.size.width >= 768 && Get.size.width < 1024;

  bool get mobile => Get.size.width < 768;

  static T when<T>({
    required T desktop,
    T? table,
    T? mobile,
  }) {
    final AppScreenSizes appScreenSizes = AppScreenSizes();
    if (appScreenSizes.desktop) {
      return desktop;
    } else if (appScreenSizes.table) {
      return table ?? desktop;
    } else {
      return mobile ?? table ?? desktop;
    }
  }
}
