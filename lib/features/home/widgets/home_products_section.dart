import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_product_card.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({
    super.key,
    required this.controllerListProducts,
    required this.controllerViewState,
  });

  final List<Product> controllerListProducts;
  final ProductsViewState controllerViewState;

  @override
  Widget build(BuildContext context) {
    if (controllerViewState == ProductsViewState.error) {
      return Text('Problema ao resgatar produtos');
    }
    return Skeletonizer(
      enabled: controllerViewState == ProductsViewState.loading,
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: _getProductsList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Product product = _getProductsList()[index];
            return HomeProductCard(product: product);
          },
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
