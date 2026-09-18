import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/utils.dart';

class CartTotalCard extends StatelessWidget {
  const CartTotalCard({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    const heroTag = 'totalCard';

    return Hero(
      tag: heroTag,
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey100),
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total do Pedido', style: AppTextStyle.smallGreyBold),
              Text(Utils.formatCurrency(total), style: AppTextStyle.price),
            ],
          ),
        ),
      ),
    );
  }
}
