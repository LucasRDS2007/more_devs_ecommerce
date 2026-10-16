class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final String categoryId;

  Product({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.category,
    required this.description,
    required this.id,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      categoryId: json['categoryId'],
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      description: json['description'],
    );
  }
}
