import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/cart/pages/cart_page.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/modals.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_quantity_selector.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_remove_confirmation.dart';
import 'package:provider/provider.dart';

class AppModalProductCard extends StatelessWidget {
  const AppModalProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(product.name, style: AppTextStyle.title),

            Text(product.brand, style: AppTextStyle.smallGrey),

            Text(product.description, style: AppTextStyle.smallBlack),
            const SizedBox(height: 10),
            Text('R\$${product.price.toString()}', style: AppTextStyle.price),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Consumer<CartController>(
                builder: (context, cartController, child) {
                  int quantity = cartController.getQuantity(product);
                  ProductCart? productCart = cartController.validationProduct(
                    product,
                  );
                  return quantity == 0
                      ? AppElevatedButton(
                          type: ButtonType.filled,
                          textButton: 'Adicionar ao carrinho',
                          onPressed: () {
                            cartController.addProduct(product);
                          },
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, CartPage.route);
                                },
                                child: Text(
                                  'No Carrinho',
                                  style: AppTextStyle.titleGrey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: AppQuantitySelector(
                                increment: () {
                                  cartController.increment(productCart!);
                                },
                                decrement: () async {
                                  if (cartController.getQuantity(
                                        productCart!,
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
                                      cartController.removeProduct(productCart);
                                      cartController.decrement(productCart);
                                    }
                                    return;
                                  }
                                  cartController.decrement(productCart);
                                },
                                product: product,
                                quantity: cartController.getQuantity(product),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
