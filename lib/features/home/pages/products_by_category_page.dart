import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/products_by_category_controller.dart';
import 'package:more_devs_ecommerce/features/home/widgets/products_by_category_section.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryPage extends StatelessWidget {
  const ProductsByCategoryPage({super.key, required this.categoryName});

  static String route = '/products-by-category-page';
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName, style: AppTextStyle.tittle),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),
      body: Consumer<ProductsByCategoryController>(
        builder: (context, controler, child) {
          return Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              children: [
                AppTextField(hintText: 'Rabanete'),
                ProductsByCategorySection(
                  controllerListProducts: controler.products,
                  controllerViewState: controler.productsState,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
