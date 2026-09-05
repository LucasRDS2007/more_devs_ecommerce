import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> categoryProducts = [];
  List<Product> searchProducts = [];
  List<String> brandsProducts = [];

  ProductsViewState productsState = ProductsViewState.loading;

  String selectedBrand = '';
  String searchValue = '';

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  Future<void> getProducts(String category) async {
    brandsProducts = [];
    searchValue = '';
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 1));
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
      initBrands();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void search(String value) {
    searchValue = value;
    try {
      searchProducts = categoryProducts.where((item) {
        return item.name.toLowerCase().toString().contains(
          searchValue.toLowerCase(),
        );
      }).toList();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void setSelectedBrand(String brand) {
    selectedBrand = brand;
    try {
      searchProducts = categoryProducts.where((item) {
        if (searchValue.isNotEmpty) {
          return item.name.toLowerCase().toString().contains(
                searchValue.toLowerCase(),
              ) &&
              item.brand.toLowerCase().toString().contains(brand.toLowerCase());
        }
        return item.brand.toLowerCase().toString().contains(
          brand.toLowerCase(),
        );
      }).toList();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void initBrands() {
    brandsProducts = searchProducts.map((item) {
      return item.brand.toString();
    }).toList();
    brandsProducts = brandsProducts.toSet().toList();
  }
}
