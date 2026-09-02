import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> categoryProducts = [];
  List<Product> searchProducts = [];

  ProductsViewState productsState = ProductsViewState.loading;

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  Future<void> getProducts(String category) async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 2));
    try {
      categoryProducts = productsJson
          .where((item) {
            return item['category'].toString().toLowerCase() ==
                category.toLowerCase();
          })
          .map((item) {
            return Product.fromJson(item);
          })
          .toList();

      searchProducts = List.from(categoryProducts);
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void search(String value) {
    try {
      searchProducts = categoryProducts.where((item) {
        return item.name.toLowerCase().toString().contains(value.toLowerCase());
      }).toList();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
