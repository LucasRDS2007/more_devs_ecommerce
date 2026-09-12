import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';

class AppModifyButton extends StatelessWidget {
  const AppModifyButton({
    super.key,
    required this.operator,
    required this.onPressed,
  });

  final String operator;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(60, 40),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        textStyle: AppTextStyle.buttonLabel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: Text(operator),
    );
  }
}
