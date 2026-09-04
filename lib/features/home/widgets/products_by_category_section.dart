import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/widgets/product_card.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsByCategorySection extends StatelessWidget {
  const ProductsByCategorySection({
    super.key,
    required this.controllerListProducts,
    required this.controllerViewState,
    required this.categoryName,
  });

  final List<Product> controllerListProducts;
  final ProductsViewState controllerViewState;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    if (controllerViewState == ProductsViewState.error) {
      return Text('Problema ao resgatar produtos');
    }
    return Expanded(
      child: Skeletonizer(
        enabled: controllerViewState == ProductsViewState.loading,
        child: Center(
          child: GridView.builder(
            itemCount: _getProductsList().length,
            itemBuilder: (context, index) {
              Product product = _getProductsList()[index];
              return ProductCard(product: product);
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              mainAxisExtent: 265,
              crossAxisSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }

  List<Product> _getProductsList() {
    return controllerViewState == ProductsViewState.loading
        ? fakeLoadingProducts
        : controllerListProducts;
  }
}
