import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/colors.dart';
import '../../../../configs/themes/typography.dart';

class DefaultBottomSheetLayout extends StatelessWidget {
  const DefaultBottomSheetLayout({
    super.key,
    required this.title,
    required this.content,
    required this.action,
  });

  final String title;
  final Widget content;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          child: Container(
            margin: const EdgeInsets.all(8).copyWith(top: Get.mediaQuery.padding.top + 8),
            width: 80,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.grayLight,
            ),
          ),
        ),
        Flexible(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            color: AppColors.grayLight.shade50,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    leading: BackButton(
                      onPressed: () {
                        Get.dialog(AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text('Do you want to cancel this action without saving?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back(closeOverlays: true);
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ));
                      },
                    ),
                    title: Text(
                      title,
                      style: AppTypography.headingH2,
                    ),
                  ),
                  Flexible(child: content),
                  if (action != null)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: action!,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
