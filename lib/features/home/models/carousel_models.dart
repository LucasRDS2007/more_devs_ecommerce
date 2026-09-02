class CarouselItem {
  final String title;
  final String imageUrl;

  const CarouselItem({required this.title, required this.imageUrl});

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(title: json['title'], imageUrl: json['imageUrl']);
  }
}
