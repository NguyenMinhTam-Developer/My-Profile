import 'package:flutter/material.dart';
import 'package:my_profile/configs/themes/colors.dart';
import 'package:my_profile/configs/themes/typography.dart';

class MenuLink extends StatelessWidget {
  const MenuLink({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all(Size.zero),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.grayLight.shade900;
            }

            return AppColors.grayLight.shade600;
          },
        ),
      ),
      child: Text(
        title,
        style: AppTypography.body2Medium,
      ),
    );
  }
}
