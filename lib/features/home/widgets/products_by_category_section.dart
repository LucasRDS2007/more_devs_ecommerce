import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_product_card.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsByCategorySection extends StatelessWidget {
  const ProductsByCategorySection({
    super.key,
    required this.controllerListProducts,
    required this.controllerViewState,
  });

  final List<Product> controllerListProducts;
  final ProductsViewState controllerViewState;

  @override
  Widget build(BuildContext context) {
    // if (controllerViewState == ProductsViewState.error) {
    //   return Text('Problema ao resgatar produtos');
    // }
    return Expanded(
      child: Center(
        child: GridView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => HomeProductCard(
            product: Product(
              name: 'name',
              imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
              brand: 'brand',
              price: 10,
              category: 'Frutas',
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            mainAxisExtent: 260,
            crossAxisSpacing: 0,
            // crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
          ),
        ),
      ),
    );

    // return Skeletonizer(
    //   enabled: controllerViewState == ProductsViewState.loading,
    //   child: SizedBox(
    //     height: 300,
    //     child: ListView.builder(
    //       itemCount: _getProductsList().length,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (context, index) {
    //         Product product = _getProductsList()[index];
    //         return HomeProductCard(product: product);
    //       },
    //     ),
    //   ),
    // );
  }

  List<Product> _getProductsList() {
    return controllerViewState == ProductsViewState.loading
        ? fakeLoadingProducts
        : controllerListProducts;
  }
}
