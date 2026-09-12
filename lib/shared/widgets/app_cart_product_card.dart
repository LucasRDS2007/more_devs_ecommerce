import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_quantity_selector.dart';

class AppCartCard extends StatelessWidget {
  const AppCartCard({
    super.key,
    required this.productCart,
    required this.increment,
    required this.decrement,
  });
  final ProductCart productCart;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 130,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
                    ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Produto', style: AppTextStyle.smallBlackBlold),
                          Text('Marca', style: AppTextStyle.smallGreyBlold),
                        ],
                      ),
                      Text('RS 99,50', style: AppTextStyle.price),
                    ],
                  ),
                  AppQuantitySelector(
                    increment: increment,
                    decrement: decrement,
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
