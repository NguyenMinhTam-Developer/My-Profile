import 'package:flutter/material.dart';

import '../../../configs/constants/sizes.dart';

class Gutter extends StatelessWidget {
  const Gutter({super.key, this.scale = 1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kGutter * scale,
      height: kGutter * scale,
    );
  }
}
