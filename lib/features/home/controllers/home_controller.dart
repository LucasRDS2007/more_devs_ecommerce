import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/models/carousel_models.dart';
import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/mocks.dart';

enum CategoriesViewState { loading, sucess, error }

enum CarouselViewState { loading, sucess, error }

enum ProductsViewState { loading, sucess, error }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];
  List<Product> products = [];
  List<CarouselItem> carouselItens = [];
  int activeIndex = 0;

  CategoriesViewState categoriesState = CategoriesViewState.loading;
  ProductsViewState productsState = ProductsViewState.loading;
  CarouselViewState carouselState = CarouselViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;
    notifyListeners();
  }

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  void changeCarouselState(CarouselViewState state) {
    carouselState = state;
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

  void changeCarouselIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  Future<void> getCarouselItens() async {
    changeCarouselState(CarouselViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      carouselItens = carouselJson.map((item) {
        return CarouselItem.fromJson(item);
      }).toList();
      changeCarouselState(CarouselViewState.sucess);
    } catch (e, stackTrace) {
      debugPrint('ERRO CAROUSEL: $e');
      debugPrintStack(stackTrace: stackTrace);
      changeCarouselState(CarouselViewState.error);
    }
  }
}
