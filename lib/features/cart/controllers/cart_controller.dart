import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/cart/services/cart_service.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class CartController extends ChangeNotifier {
  CartService cartService = CartService();
  Cart? cart;
  bool isLoading = true;
  bool isUpdating = false;

  void getCart(String? token) async {
    isLoading = true;
    notifyListeners();

    try {
      cart = await cartService.getCart(token);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  int get getProductCartQuantity {
    return cart?.items.length ?? 0;
  }

  double get total {
    return cart?.items.fold<double>(
          0.0,
          (sum, item) => sum + item.subTotal,
        ) ??
        0.0;
  }

  ProductCart? validationProduct(Product product) {
    if (cart == null) return null;

    ProductCart? existingProduct = cart!.items.where((item) {
      return item.name == product.name;
    }).firstOrNull;
    return existingProduct;
  }

  int getQuantity(Product product) {
    ProductCart? existingProduct = validationProduct(product);
    return existingProduct != null ? existingProduct.quantity : 0;
  }

  void addProduct(String? token, String productId) async {
    if (token == null || token.trim().isEmpty) return;

    isUpdating = true;
    notifyListeners();
    try {
      cart = await cartService.addItem(
        token: token,
        productId: productId,
        quantity: 1,
      );
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }

  void removeProduct(String? token, String productId) async {
    if (token == null || token.trim().isEmpty) return;

    isUpdating = true;
    notifyListeners();
    try {
      cart = await cartService.removeItem(token: token, productId: productId);
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }

  void increment(ProductCart productCart, {required String token}) async {
    if (token.trim().isEmpty) {
      throw ArgumentError.value(token, 'token', 'Token invalido.');
    }

    isUpdating = true;
    notifyListeners();
    try {
      cart = await cartService.updateItem(
        token: token,
        productId: productCart.id,
        quantity: productCart.quantity + 1,
      );
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }

  void decrement(ProductCart productCart, {required String token}) async {
    if (token.trim().isEmpty) {
      throw ArgumentError.value(token, 'token', 'O token não pode ser vazio.');
    }

    isUpdating = true;
    notifyListeners();
    try {
      cart = await cartService.updateItem(
        token: token,
        productId: productCart.id,
        quantity: productCart.quantity - 1,
      );
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }
}
