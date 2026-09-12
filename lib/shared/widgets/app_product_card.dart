import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/modals.dart';
import 'package:more_devs_ecommerce/shared/utils.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_modal_product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppProductCard extends StatelessWidget {
  const AppProductCard({super.key, required this.product, this.width});
  final Product product;
  final double? width;

  @override
  Widget build(BuildContext context) {
    Modals modals = Modals();
    Untils untils = Untils();
    return GestureDetector(
      onTap: () {
        modals.appBottomSheet(context, AppModalProductCard(product: product));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton.replace(
              width: width,
              height: 160,
              replacement: Bone.square(
                size: 160,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
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
      ),
    );
  }
}
