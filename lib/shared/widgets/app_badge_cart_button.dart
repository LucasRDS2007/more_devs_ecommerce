import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_button_cart_page.dart';

class AppBadgeCartButton extends StatelessWidget {
  const AppBadgeCartButton({super.key, required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppButtonCartPage(),
        Positioned(
          right: 10,
          top: 5,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              quantity.toString(),
              style: AppTextStyle.smallerWhiteBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
