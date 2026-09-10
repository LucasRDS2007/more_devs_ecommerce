import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
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
                // ListView(),
                Spacer(),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Text('RS 99,50')),
                    Expanded(
                      child: AppElevatedButton(
                        textButton: 'Continuar',
                        type: ButtonType.filled,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
