import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_confirm_section.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/checkout_line_products.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_total_card.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static String route = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar Pedido', style: AppTextStyle.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, cartController, child) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // CartTotalCard(total: cartController.total),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cartController.productCartList.length,
                            itemBuilder: (BuildContext context, int index) {
                              ProductCart productCart =
                                  cartController.productCartList[index];
                              return Padding(
                                padding: const EdgeInsets.all(4),
                                child: CartLineProducts(
                                  productQuantity: cartController.getQuantity(
                                    productCart,
                                  ),
                                  productName: productCart.name,
                                  subTotal: productCart.subTotal,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CartCheckoutSection(
                  column: Column(
                    spacing: 10,
                    children: [
                      AppElevatedButton(
                        textButton: 'Confirmar Pedido',
                        type: ButtonType.filled,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
