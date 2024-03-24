import 'package:get/get.dart';

import '../../app/presentation/authentication/presentation/pages/login_page.dart';
import '../../app/presentation/home/controllers/home_controller.dart';
import '../../app/presentation/home/pages/home_page.dart';
import 'route_name.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
