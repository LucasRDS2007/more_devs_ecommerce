import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/cart/pages/checkout_page.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_total_card.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/features/login/models/auth_user.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/modals.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_card.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_remove_confirmation.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_section_cart_empty.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_confirm_section.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    AuthUser authUser = context.read<LoginController>().authUser!;
    CartController cartController = context.read<CartController>();
    super.initState();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getCart(authUser.tokens!.accessToken);
    });
  }

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
            //TODO colocar os estados de loading e de erro
            if (cartController.cart!.items.isEmpty) {
              return AppSectionCartEmpty();
            }
            return Consumer<LoginController>(
              builder: (context, loginController, child) {
                final token = loginController.accessToken;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cart!.items.length,
                        itemBuilder: (context, index) {
                          ProductCart productCart =
                              cartController.cart!.items[index];
                          return CartCard(
                            productCart: productCart,
                            decrement: token == null
                                ? () {}
                                : () async {
                                    if (cartController.getQuantity(
                                          productCart,
                                        ) ==
                                        1) {
                                      final cartRemover =
                                          await Modals.confirmationDialogAlert<
                                            bool
                                          >(
                                            context,
                                            body: AppRemoveConfirmation(
                                              title:
                                                  'Retirar ${productCart.name} do Carrinho?',
                                              content:
                                                  'Tem certeza que deseja retirar ${productCart.name} do carrinho? Essa ação não pode ser desfeita.',
                                            ),
                                          );

                                      if (cartRemover == true) {
                                        cartController.removeProduct(
                                          productCart,
                                        );
                                      }
                                      return;
                                    }
                                    cartController.decrement(
                                      productCart,
                                      token: token,
                                    );
                                  },
                            increment: () {
                              cartController.increment(productCart);
                            },
                            quantity: cartController.getQuantity(productCart),
                          );
                        },
                      ),
                    ),
                    CartCheckoutSection(
                      column: Column(
                        spacing: 10,
                        children: [
                          CartTotalCard(total: cartController.total),
                          AppElevatedButton(
                            textButton: 'Continuar',
                            type: ButtonType.filled,
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(CheckoutPage.route);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
