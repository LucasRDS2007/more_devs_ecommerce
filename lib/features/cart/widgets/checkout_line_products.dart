import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/utils.dart';

class CartLineProducts extends StatelessWidget {
  const CartLineProducts({
    super.key,
    required this.productQuantity,
    required this.productName,
    required this.subTotal,
  });

  final int productQuantity;
  final String productName;
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${productQuantity}x $productName',
          style: AppTextStyle.smallBlackBlold,
        ),
        Text(Utils.formatCurrency(subTotal), style: AppTextStyle.smallGreyBold),
      ],
    );
  }
}
