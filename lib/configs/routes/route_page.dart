import 'package:get/get.dart';

import '../../app/presentation/home/bindings/home_binding.dart';
import '../../app/presentation/home/pages/home_page.dart';
import 'route_name.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
