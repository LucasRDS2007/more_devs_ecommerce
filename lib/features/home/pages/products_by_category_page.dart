import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/widgets/products_by_category_section.dart';
import 'package:more_devs_ecommerce/shared/services/analytics/analytics_mixin.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/services/remote_config/remote_config_service.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_badge_cart_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_button_cart_page.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_dropdown_button_form_field.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.category});

  static String route = '/products-by-category-page';
  final Category category;

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> with AnalyticsMixin<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      context.read<ProductsByCategoryController>().getProductsByCategory(
        widget.category.id,
      );
      viewItemList(widget.category.name);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name, style: AppTextStyle.title),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) {
              return Consumer<CartController>(
                builder: (context, cartController, child) {
                  return Visibility(
                    replacement: SizedBox(width: 24, height: 24,),
            visible: RemoteConfigService.instance.cartEnabled,
                    child: Visibility(
                      replacement: AppButtonCartPage(),
                      visible: cartController.getProductCartQuantity > 0,
                      child: AppBadgeCartButton(
                        quantity: cartController.getProductCartQuantity,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
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
                    EasyDebounce.debounce('searchAnalytics', Duration(seconds: 1),() {
                      search(value, widget.category.name, controller.filteredProducts.length.toString());
                    }, );
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
                categoryName: widget.category.name, screenName: '',
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  String get screenName => ProductsByCategoryPage.route;
}
