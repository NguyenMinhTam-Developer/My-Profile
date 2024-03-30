import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final scrollController = ScrollController();

  final Duration _scrollingDuration = const Duration(milliseconds: 500);
  final Curve _scrollingCurves = Curves.linear;

  GlobalKey heroKey = GlobalKey();
  GlobalKey aboutKey = GlobalKey();
  GlobalKey skillsKey = GlobalKey();
  GlobalKey experienceKey = GlobalKey();
  GlobalKey workKey = GlobalKey();
  GlobalKey testimonialsKey = GlobalKey();
  GlobalKey contactKey = GlobalKey();

  void navigateToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: _scrollingDuration,
      curve: _scrollingCurves,
    );
  }

  static HomePageController get findOrInitialize {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(HomePageController());
    }
  }
}
