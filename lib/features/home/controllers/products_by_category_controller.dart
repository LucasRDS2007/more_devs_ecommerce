import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> categoryProducts = [];
<<<<<<< HEAD
  List<String> brandsProducts = [];
  List<Product> filteredProducts = [];

  ProductsViewState productsState = ProductsViewState.loading;

  String searchQuery = '';
  String selectedBrand = '';

=======
  List<Product> searchProducts = [];

  ProductsViewState productsState = ProductsViewState.loading;

>>>>>>> c1cce7142b3dc45c16389879d63654861c65f3fb
  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

<<<<<<< HEAD
  void setSearchQuery(String query) {
    searchQuery = query;
    getFilteredProducts();
  }

  void setSelectedBrand(String brand) {
    selectedBrand = brand;
    getFilteredProducts();
  }

  Future<void> getProductsByCategory(String category) async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 1));
=======
  Future<void> getProducts(String category) async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 2));
>>>>>>> c1cce7142b3dc45c16389879d63654861c65f3fb
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
<<<<<<< HEAD
      getBrands();
      clearFilters();
=======

      searchProducts = List.from(categoryProducts);
>>>>>>> c1cce7142b3dc45c16389879d63654861c65f3fb
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

<<<<<<< HEAD
  void getBrands() {
    brandsProducts = categoryProducts
        .map((item) {
          return item.brand;
        })
        .toSet()
        .toList();
  }

  bool matchesSearch(Product item) {
    return item.name.toLowerCase().contains(searchQuery.toLowerCase());
  }

  bool matchesBrand(Product item) {
    if (selectedBrand.isEmpty) {
      return true;
    }

    return item.brand.toLowerCase() == selectedBrand.toLowerCase();
  }

  void clearFilters() {
    searchQuery = '';
    selectedBrand = '';
    filteredProducts = List.from(categoryProducts);
  }

  void getFilteredProducts() {
    try {
      filteredProducts = categoryProducts.where((item) {
        return matchesSearch(item) && matchesBrand(item);
=======
  void search(String value) {
    try {
      searchProducts = categoryProducts.where((item) {
        return item.name.toLowerCase().toString().contains(value.toLowerCase());
>>>>>>> c1cce7142b3dc45c16389879d63654861c65f3fb
      }).toList();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
