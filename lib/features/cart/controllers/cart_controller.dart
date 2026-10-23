import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/features/cart/services/cart_service.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class CartController extends ChangeNotifier {
  CartService cartService = CartService();
  Cart? cart;

  void getCart(String? token) async {
    try {
      cart = await cartService.getCart(token);
      notifyListeners();
    } catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  int get getProductCartQuantity {
    return cart!.items.length;
  }

  double get total {
    return cart!.items.fold<double>(0.0, (sum, item) => sum + item.subTotal);
  }

  ProductCart? validationProduct(Product product) {
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

    try {
      cart = await cartService.addItem(
        token: token,
        productId: productId,
        quantity: 1,
      );
      notifyListeners();
    } catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  void removeProduct(ProductCart productCart) {
    //DELETE /cart/items
    //repopula o cart
    cart!.items.removeAt(cart!.items.indexOf(productCart));
    notifyListeners();
  }

  void increment(ProductCart productCart) {
    //passar pra Api o ID do produto e a quantidade atualizada
    productCart.quantity++;
    cart!.items[cart!.items.indexOf(productCart)] = productCart;
    notifyListeners();
  }

  void decrement(ProductCart productCart, {required String token}) {
    //passar pra Api o ID do produto e a quantidade atualizada
    if (token.trim().isEmpty) {
      throw ArgumentError.value(token, 'token', 'O token não pode ser vazio.');
    }

    productCart.quantity--;
    cart!.items[cart!.items.indexOf(productCart)] = productCart;
    notifyListeners();
  }
}
