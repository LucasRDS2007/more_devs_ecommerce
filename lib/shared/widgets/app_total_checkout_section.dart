import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';

class AppTotalCheckoutSection extends StatelessWidget {
  const AppTotalCheckoutSection({
    super.key,
    required this.onPressed,
    required this.total,
  });

  final VoidCallback? onPressed;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(total, style: AppTextStyle.price)),
          Expanded(
            child: AppElevatedButton(
              textButton: 'Continuar',
              type: ButtonType.filled,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
