import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class CartController extends ChangeNotifier {
  List<ProductCart> productCartList = [];
  //TODO decrement recebe produto por parametro, encontra o item na lista productCartList, incrementa quantity e atualiza a lista

  double get total {
    return productCartList.fold(0, (sum, item) => sum + item.subTotal);
  }

  bool hasProduct(Product product) {
    return productCartList.any((item) => item.name == product.name);
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
