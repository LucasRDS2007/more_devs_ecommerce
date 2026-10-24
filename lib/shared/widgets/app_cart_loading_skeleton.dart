import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_card.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_confirm_section.dart';
import 'package:more_devs_ecommerce/features/cart/widgets/cart_total_card.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppCartLoadingSkeleton extends StatelessWidget {
  const AppCartLoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    final product = ProductCart(
      id: 'loading-product',
      name: 'Produto carregando',
      brand: 'Marca',
      imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
      price: 10,
      categoryId: 'loading-category',
      category: 'Categoria',
      description: '',
      quantity: 1,
    );

    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => CartCard(
                productCart: product,
                increment: () {},
                decrement: () {},
                quantity: 1,
              ),
            ),
          ),
          CartCheckoutSection(
            column: Column(
              spacing: 10,
              children: [
                CartTotalCard(total: 10),
                AppElevatedButton(
                  textButton: 'Continuar',
                  type: ButtonType.filled,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
