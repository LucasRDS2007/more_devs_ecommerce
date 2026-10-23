import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

class Cart {
  Cart({
    required this.items,
    required this.itemCount,
    required this.total,
    required this.updatedAt,
  });

  final List<ProductCart> items;
  final int itemCount;
  final double total;
  final DateTime? updatedAt;

  factory Cart.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'];

    return Cart(
      items: itemsJson is List
          ? itemsJson
                .whereType<Map>()
                .map(
                  (item) =>
                      ProductCart.fromJson(Map<String, dynamic>.from(item)),
                )
                .toList()
          : const [],
      itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? ''),
    );
  }
}

class ProductCart extends Product {
  ProductCart({
    required super.name,
    required super.imageUrl,
    required super.brand,
    required super.price,
    required super.category,
    required super.id,
    required super.categoryId,
    required super.description,
    this.quantity = 0,
    this.updatedAt = '',
  });
  int quantity;
  String updatedAt;
  double get subTotal => (quantity * price).toDouble();

  factory ProductCart.fromProduct(Product product) {
    return ProductCart(
      name: product.name,
      imageUrl: product.imageUrl,
      brand: product.brand,
      price: product.price,
      category: product.category,
      quantity: 1,
      id: product.id,
      categoryId: product.categoryId,
      description: product.description,
      updatedAt: '',
    );
  }

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'] is Map
        ? Map<String, dynamic>.from(json['product'] as Map)
        : json;
    final product = Product.fromJson(productJson);

    return ProductCart(
      name: product.name,
      imageUrl: product.imageUrl,
      brand: product.brand,
      price: product.price,
      category: product.category,
      id: product.id,
      categoryId: product.categoryId,
      description: product.description,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );
  }
}
