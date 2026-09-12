import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_cart_product_card.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_total_checkout_section.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho', style: AppTextStyle.tittle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, cartController, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.productCartList.length,
                    itemBuilder: (context, index) {
                      ProductCart productCart =
                          cartController.productCartList[index];
                      return AppCartCard(
                        productCart: productCart,
                        decrement: () {},
                        increment: () {},
                      );
                    },
                  ),
                ),
                // AppCartProductCard(),
                Spacer(),
                AppTotalCheckoutSection(onPressed: () {}, total: 'RS 99,50'),
              ],
            );
          },
        ),
      ),
    );
  }
}
