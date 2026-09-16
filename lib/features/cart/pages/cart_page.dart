import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_cart_card.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
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
            if (cartController.productCartList.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(Icons.shopping_cart_outlined, size: 100),
                    Text('Carrinho Vazio', style: AppTextStyle.price),
                    Text(
                      'Volte a página inicial e adicione um produto ao carrinho para prosseguir com a compra.',
                      style: AppTextStyle.smallGrey,
                      textAlign: TextAlign.center,
                    ),
                    AppElevatedButton(
                      textButton: 'Voltar as Compras',
                      type: ButtonType.filled,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            }
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
                        decrement: () {
                          if (cartController.getQuantity(productCart) == 1) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(),
                            );
                            //TODO pegar a confirmação
                            cartController.removeProduct(productCart!);
                          }
                          cartController.decrement(productCart!);
                        },
                        increment: () {
                          cartController.increment(productCart);
                        },
                        quantity: cartController.getQuantity(productCart),
                      );
                    },
                  ),
                ),
                AppTotalCheckoutSection(
                  onPressed: () {},
                  total: cartController.total,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
