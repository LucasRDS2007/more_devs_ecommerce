import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
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
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.replace(
            height: 150,
            replacement: Bone.square(
              size: 150,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
