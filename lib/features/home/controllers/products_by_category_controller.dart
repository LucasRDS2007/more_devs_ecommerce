import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controllers/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/features/home/service/home_service.dart';

class ProductsByCategoryController extends ChangeNotifier {
  HomeService homeService = HomeService();

  List<Product> categoryProducts = [];
  List<String> brandsProducts = [];
  List<Product> filteredProducts = [];

  ProductsViewState productsState = ProductsViewState.loading;

  String searchQuery = '';
  String selectedBrand = '';

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    getFilteredProducts();
  }

  void setSelectedBrand(String brand) {
    selectedBrand = brand;
    getFilteredProducts();
  }

  Future<void> getProductsByCategory(String categoryId) async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 1));
    try {
      categoryProducts = await homeService.getProductsByCategory(
        categoryId: categoryId,
        sort: 'name_asc',
      );
      getBrands();
      clearFilters();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

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
      }).toList();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
