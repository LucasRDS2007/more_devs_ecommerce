import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_modify_button.dart';

class AppQuantitySelector extends StatelessWidget {
  const AppQuantitySelector({
    super.key,
    required this.increment,
    required this.decrement,
    required this.product,
    required this.quantity,
    this.isLoading = false,
  });

  final Product product;
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppModifyButton(operator: '-', onPressed: isLoading ? null : decrement),
        isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.black,
                ),
              )
            : Text('$quantity', style: AppTextStyle.title),
        AppModifyButton(operator: '+', onPressed: isLoading ? null : increment),
      ],
    );
  }
}
