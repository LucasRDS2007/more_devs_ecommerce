import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/modals.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_cart_card.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_remove_confirmation.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_section_cart_empty.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_total_checkout_section.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho', style: AppTextStyle.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, cartController, child) {
            if (cartController.productCartList.isEmpty) {
              return AppSectionCartEmpty();
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
                        decrement: () async {
                          if (cartController.getQuantity(productCart) == 1) {
                            // final cartRemover = await showDialog<bool>(
                            //   context: context,
                            //   builder: (_) => AppRemoveConfirmation(
                            //     title:
                            //         'Retirar ${productCart.name} do Carrinho?',
                            //     content:
                            //         'Tem certeza que deseja retirar ${productCart.name} do carrinho? Essa ação não pode ser desfeita.',
                            //   ),
                            // );

                            final cartRemover =
                                await Modals.confirmationDialogAlert<bool>(
                                  context,
                                  boody: AppRemoveConfirmation(
                                    title:
                                        'Retirar ${productCart.name} do Carrinho?',
                                    content:
                                        'Tem certeza que deseja retirar ${productCart.name} do carrinho? Essa ação não pode ser desfeita.',
                                  ),
                                );

                            if (cartRemover == true) {
                              cartController.removeProduct(productCart);
                              cartController.decrement(productCart);
                            }
                            return;
                          }
                          cartController.decrement(productCart);
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
