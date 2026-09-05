import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';

class Modals {
  Future<dynamic> appBottomSheet(context, Product product) {
    return showModalBottomSheet(
      isScrollControlled: true,

      // barrierColor:,
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return ModalProductCard(product: product);
      },
    );
  }
}

class ModalProductCard extends StatelessWidget {
  const ModalProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
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
            Text(product.name, style: AppTextStyle.tittle),

            Text(product.brand, style: AppTextStyle.smallGrey),

            Text(
              style: AppTextStyle.smallBlack,
              'A acerola é uma fruta tropical conhecida pelo seu sabor refrescante, levemente ácido e naturalmente adocicado. Rica em vitamina C e muito versátil, pode ser consumida in natura, utilizada em sucos, vitaminas, sobremesas e diversas receitas.Ideal para quem busca uma opção saborosa e nutritiva para o dia a dia. Produto selecionado para garantir qualidade, frescor e sabor.',
            ),
            const SizedBox(height: 10),
            Text('R\$${product.price.toString()}', style: AppTextStyle.tittle),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: AppElevatedButton(
                type: ButtonType.filled,
                textButton: 'Adicionar ao carrinho',
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
