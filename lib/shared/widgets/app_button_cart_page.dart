import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/pages/cart_page.dart';

class AppButtonCartPage extends StatelessWidget {
  const AppButtonCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart_outlined, size: 30),
      onPressed: () {
        Navigator.pushNamed(context, CartPage.route);
      },
    );
  }
}
