import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/pages/products_by_category_page.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategorieCard extends StatelessWidget {
  const HomeCategorieCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductsByCategoryPage.route,
            arguments: category.name,
          );
        },
        child: Column(
          children: [
            Skeleton.replace(
              height: 80,
              width: 80,
              replacement: Bone.circle(size: 80),
              child: Image.network(category.imageUrl.toString()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                category.name.toString(),
                style: AppTextStyle.subTittle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
