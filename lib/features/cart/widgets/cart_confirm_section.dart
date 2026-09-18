import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({super.key, required this.column});

  final Column column;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.black)),
      ),
      child: column,
    );
  }
}
