import 'package:flutter/material.dart';

class AppDropShadows {
  static List<BoxShadow> md = [
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 3,
      spreadRadius: 0,
      color: const Color(0xFF000000).withOpacity(0.07),
    ),
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 2,
      spreadRadius: 0,
      color: const Color(0xFF000000).withOpacity(0.06),
    ),
  ];

  static List<BoxShadow> lg = [
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 3,
      spreadRadius: 0,
      color: const Color(0xFF000000).withOpacity(0.10),
    ),
    BoxShadow(
      offset: const Offset(0, 10),
      blurRadius: 10,
      spreadRadius: 0,
      color: const Color(0xFF000000).withOpacity(0.04),
    ),
  ];

  static List<BoxShadow> xxl = [
    BoxShadow(
      offset: const Offset(0, 25),
      blurRadius: 25,
      spreadRadius: 0,
      color: const Color(0xFF000000).withOpacity(0.15),
    ),
  ];
}
