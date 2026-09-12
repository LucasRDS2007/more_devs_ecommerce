import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class ProductCart extends Product {
  ProductCart({
    required super.name,
    required super.imageUrl,
    required super.brand,
    required super.price,
    required super.category,
    this.quantity = 0,
  });

  final int quantity;

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    return ProductCart(
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      category: json['category'],
      quantity: json['quantity'],
    );
  }
}
