import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:more_devs_ecommerce/features/home/widgets/products_by_category_section.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/app_dropdown_button_form_field.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.categoryName});

  static String route = '/products-by-category-page';
  final String categoryName;

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      context.read<ProductsByCategoryController>().getProductsByCategory(
        widget.categoryName,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName, style: AppTextStyle.tittle),
        centerTitle: true,
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),
      body: Consumer<ProductsByCategoryController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextField(
                  hintText: 'Rabanete',
                  onChanged: (value) {
                    controller.setSearchQuery(value);
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppDropdownButtonFormField(
                  selectedBrand: controller.selectedBrand,
                  brandsProducts: controller.brandsProducts,
                  onChanged: (value) {
                    controller.setSelectedBrand(value ?? '');
                  },
                ),
              ),
              ProductsByCategorySection(
                controllerListProducts: controller.filteredProducts,
                controllerViewState: controller.productsState,
                categoryName: widget.categoryName,
              ),
            ],
          );
        },
      ),
    );
  }
}
