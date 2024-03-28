import 'package:flutter/material.dart';

import '../../../configs/themes/colors.dart';

class PictureFrameWidget extends StatelessWidget {
  const PictureFrameWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  color: AppColors.grayLight,
                  width: 8,
                ),
                color: AppColors.grayLight.shade200,
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
                  color: AppColors.grayLight,
                  width: 8,
                ),
              ),
              child: ColoredBox(
                color: AppColors.grayLight.shade200,
                child: Image.network(
                  "https://lh3.googleusercontent.com/a/ACg8ocIEccgOVpf95ygPQTuIsCPtb-KTQ8XNT1n-WeArFiFffg=s576-c-no",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.grayLight,
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
    );
  }
}
