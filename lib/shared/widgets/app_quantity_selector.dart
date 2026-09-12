import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_modify_button.dart';

class AppQuantitySelector extends StatelessWidget {
  const AppQuantitySelector({
    super.key,
    required this.increment,
    required this.decrement,
  });

  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppModifyButton(operator: '-', onPressed: () {}),
        Text('1', style: AppTextStyle.tittle),
        AppModifyButton(operator: '+', onPressed: () {}),
      ],
    );
  }
}
