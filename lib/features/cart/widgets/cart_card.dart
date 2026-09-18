import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/utils.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_quantity_selector.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.productCart,
    required this.increment,
    required this.decrement,
    required this.quantity,
  });
  final ProductCart productCart;
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 1.4),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(productCart.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productCart.name,
                              style: AppTextStyle.smallBlackBlold,
                            ),
                            Text(
                              productCart.brand,
                              style: AppTextStyle.smallGreyBold,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          Utils.formatCurrency(productCart.subTotal),
                          style: AppTextStyle.subPrice,
                        ),
                      ),
                    ],
                  ),
                  AppQuantitySelector(
                    product: productCart,
                    increment: increment,
                    decrement: decrement,
                    quantity: quantity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
