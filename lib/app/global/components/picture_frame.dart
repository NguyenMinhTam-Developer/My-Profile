import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/themes/colors.dart';
import '../controllers/theme_controller.dart';

class PictureFrameWidget extends StatelessWidget {
  const PictureFrameWidget({
    super.key,
    required this.width,
    required this.height,
    required this.frameColor,
  });

  final double width;
  final double height;
  final Color frameColor;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 20,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: frameColor,
                    width: 8,
                  ),
                  color: ThemeController.findOrInitialize.when(
                    lightMode: AppColors.grayLight.shade200,
                    darkMode: AppColors.grayDark.shade200,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 0,
              bottom: 20,
              child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(
                    color: frameColor,
                    width: 8,
                  ),
                ),
                child: ColoredBox(
                  color: ThemeController.findOrInitialize.when(
                    lightMode: AppColors.grayLight.shade200,
                    darkMode: AppColors.grayDark.shade200,
                  ),
                  child: Image.network(
                    "https://lh3.googleusercontent.com/a/ACg8ocIEccgOVpf95ygPQTuIsCPtb-KTQ8XNT1n-WeArFiFffg=s576-c-no",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.person,
                          color: ThemeController.findOrInitialize.when(
                            lightMode: AppColors.grayLight,
                            darkMode: AppColors.grayDark,
                          ),
                          size: 100,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
