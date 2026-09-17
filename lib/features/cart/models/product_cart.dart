import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class ProductCart extends Product {
  ProductCart({
    required super.name,
    required super.imageUrl,
    required super.description,
    required super.brand,
    required super.price,
    required super.category,
    this.quantity = 0,
  });

  int quantity;
  double get subTotal {
    return quantity * price;
  }

  //add subtotal
  factory ProductCart.fromProduct(Product product) {
    return ProductCart(
      brand: product.brand,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
      category: product.category,
      quantity: 1,
    );
  }
}
