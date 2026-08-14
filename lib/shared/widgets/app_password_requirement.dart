import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';

class AppPasswordRequirement extends StatelessWidget {
  const AppPasswordRequirement({
    super.key,
    required this.label,
    required this.isValid,
  });

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(
          Icons.check_circle,
          color: isValid ? AppColors.green : AppColors.black,
        ),
        Text(
          label,
          style: isValid
              ? AppTextStyle.passwordRequirementValid
              : AppTextStyle.passwordRequirementInValid,
        ),
      ],
    );
  }
}
