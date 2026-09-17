import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';

class AppSectionCartEmpty extends StatelessWidget {
  const AppSectionCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
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
}
