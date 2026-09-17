import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class CartController extends ChangeNotifier {
  List<ProductCart> productCartList = [];

  int get getProductCartQuantity {
    return productCartList.length;
  }

  double get total {
    return productCartList.fold(0, (sum, item) => sum + item.subTotal);
  }

  ProductCart? validationProduct(Product product) {
    ProductCart? existingProduct = productCartList.where((item) {
      return item.name == product.name;
    }).firstOrNull;
    return existingProduct;
  }

  int getQuantity(Product product) {
    ProductCart? existingProduct = validationProduct(product);
    return existingProduct != null ? existingProduct.quantity : 0;
  }

  void addProduct(Product product) {
    productCartList.add(ProductCart.fromProduct(product));
    notifyListeners();
  }

  void removeProduct(ProductCart productCart) {
    productCartList.removeAt(productCartList.indexOf(productCart));
    notifyListeners();
  }

  void increment(ProductCart productCart) {
    productCart.quantity++;
    productCartList[productCartList.indexOf(productCart)] = productCart;
    notifyListeners();
  }

  void decrement(ProductCart productCart) {
    productCart.quantity--;

    productCartList[productCartList.indexOf(productCart)] = productCart;
    notifyListeners();
  }
}
