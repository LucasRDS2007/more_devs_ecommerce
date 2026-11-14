import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';

class AppRemoveProductConfirmationDialog extends StatelessWidget {
  const AppRemoveProductConfirmationDialog({
    super.key,
    required this.title,
    required this.content, required this.product, required this.screenName,
  });
  final String title;
  final String content;
  final ProductCart product;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.remove_shopping_cart_outlined,
        size: 80,
        color: AppColors.black,
      ),
      title: Text(title, style: AppTextStyle.title),
      content: Text(content, style: AppTextStyle.smallBlack),
      actions: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: AppElevatedButton(
                textButton: 'Não',
                type: ButtonType.outlined,
                onPressed: () => Navigator.pop(context, false), buttonAnalytics: null,
              ),
            ),
            Expanded(
              child: AppElevatedButton(

                textButton: 'Sim',
                type: ButtonType.filled,
                onPressed: () => Navigator.pop(context, true), buttonAnalytics: ButtonAnalytics('remove_from_cart_dialog', screenName, parameters: {'item_name': product.name, 'item_brand': product.brand, 'item_category': product.category, 'price': product.price.toString(), 'currency': 'BRL',} ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
