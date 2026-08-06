import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox(this.value, {super.key, this.onChanged});

  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.black,
    );
  }
}
