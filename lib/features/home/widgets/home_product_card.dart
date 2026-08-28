import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/untils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeProductCard extends StatelessWidget {
  const HomeProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    Untils untils = Untils();
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.replace(
            height: 150,
            width: 150,
            child: Image.network(product.imageUrl.toString()),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              product.brand.toString(),
              style: AppTextStyle.smallGrey,
            ),
          ),
          Text(product.name.toString(), style: AppTextStyle.subTittle),
          Text(
            untils.formatCurrency(product.price),
            style: AppTextStyle.tittle,
          ),
        ],
      ),
    );
  }
}
