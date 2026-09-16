import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_modify_button.dart';

class AppQuantitySelector extends StatelessWidget {
  const AppQuantitySelector({
    super.key,
    required this.increment,
    required this.decrement,
    required this.product,
    required this.quantity,
  });

  final Product product;
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppModifyButton(
          operator: '-',
          onPressed: () {
            decrement();
          },
        ),
        Text('${quantity}', style: AppTextStyle.tittle),
        AppModifyButton(
          operator: '+',
          onPressed: () {
            increment();
          },
        ),
      ],
    );
  }
}
