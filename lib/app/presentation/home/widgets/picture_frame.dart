import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/image_picker_service.dart';
import '../../../../configs/themes/colors.dart';

class PictureFrameWidget extends StatelessWidget {
  const PictureFrameWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.onImageChange,
  });

  final double width;
  final double height;
  final String imagePath;
  final Function(String imagePath) onImageChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        File? file = await ImagePickerService.pickImage(source: ImageSource.gallery);

        if (file != null) {
          String? newImage = await ImagePickerService.saveImage(file);

          if (newImage != null) {
            onImageChange(newImage);
          }
        }
      },
      child: SizedBox(
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
                  child: imagePath.isNotEmpty
                      ? Image.file(
                          File(imagePath),
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
                        )
                      : Image.network(
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
      ),
    );
  }
}
