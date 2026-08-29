import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Category> categories = [];
  List<Product> products = [];

  CategoriesViewState categoriesState = CategoriesViewState.loading;
  ProductsViewState productsState = ProductsViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;
    notifyListeners();
  }

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  Future<void> getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = categoriesJson.map((item) {
        return Category.fromJson(item);
      }).toList();

      changeCategoriesState(CategoriesViewState.sucess);
    } catch (e) {
      changeCategoriesState(CategoriesViewState.error);
    }
  }

  Future<void> getProducts() async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      products = productsJson.map((item) {
        return Product.fromJson(item);
      }).toList();
      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
