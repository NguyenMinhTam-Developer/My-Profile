import 'package:get/get.dart';

class AppScreenSizes {
  AppScreenSizes();

  bool get isDesktop => Get.size.width >= 1024;

  bool get istTablet => Get.size.width >= 768 && Get.size.width < 1024;

  bool get isMobile => Get.size.width < 768;

  static T when<T>({
    required T desktop,
    T? table,
    T? mobile,
  }) {
    final AppScreenSizes appScreenSizes = AppScreenSizes();
    if (appScreenSizes.isDesktop) {
      return desktop;
    } else if (appScreenSizes.istTablet) {
      return table ?? desktop;
    } else {
      return mobile ?? table ?? desktop;
    }
  }
}
