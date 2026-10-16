import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

final List<Map<String, dynamic>> carouselJson = [
  {
    'title': 'Aproveite as ofertas',
    'imageUrl':
        'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=640&q=75',
  },
  {
    'title': 'Experimente agora!',
    'imageUrl':
        'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=640&q=75',
  },
];

final List<Category> fakeLoadingCategories = [
  Category(
    id: 'cat-frutas',
    name: 'Frutas',
    imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
  ),
  Category(
    id: 'cat-verduras',
    name: 'Verduras',
    imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
  ),
  Category(
    id: 'cat-padaria',
    name: 'Padaria',
    imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
  ),
  Category(
    id: 'cat-importados',
    name: 'Importados',
    imageUrl: 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
  ),
];

final List<Product> fakeLoadingProducts = [
  Product(
    id: 'prod-1',
    categoryId: 'cat-verduras',
    brand: 'Natural da terra',
    name: 'Rabanete',
    description: '',
    imageUrl: '',
    price: 10.99,
    category: 'Verduras',
  ),
  Product(
    id: 'prod-2',
    categoryId: 'cat-verduras',
    brand: 'Natural da terra',
    name: 'Cogumelo',
    description: '',
    imageUrl: '',
    price: 12.19,
    category: 'Verduras',
  ),
  Product(
    id: 'prod-3',
    categoryId: 'cat-verduras',
    brand: 'Natural da terra',
    name: 'Alface',
    description: '',
    imageUrl: '',
    price: 4.50,
    category: 'Verduras',
  ),
  Product(
    id: 'prod-4',
    categoryId: 'cat-frutas',
    brand: 'Akatsu',
    name: 'Acerola',
    description: '',
    imageUrl: '',
    price: 7.99,
    category: 'Frutas',
  ),
  Product(
    id: 'prod-5',
    categoryId: 'cat-frutas',
    brand: 'Akatsu',
    name: 'Banana',
    description: '',
    imageUrl: '',
    price: 6.29,
    category: 'Frutas',
  ),
  Product(
    id: 'prod-6',
    categoryId: 'cat-frutas',
    brand: 'Akatsu',
    name: 'Morango',
    description: '',
    imageUrl: '',
    price: 9.90,
    category: 'Frutas',
  ),
  Product(
    id: 'prod-7',
    categoryId: 'cat-padaria',
    brand: 'Pão & Cia',
    name: 'Pão francês',
    description: '',
    imageUrl: '',
    price: 15.00,
    category: 'Padaria',
  ),
  Product(
    id: 'prod-8',
    categoryId: 'cat-padaria',
    brand: 'Pão & Cia',
    name: 'Baguete',
    description: '',
    imageUrl: '',
    price: 8.75,
    category: 'Padaria',
  ),
  Product(
    id: 'prod-9',
    categoryId: 'cat-importados',
    brand: 'La Frontera',
    name: 'Queijo Manchego',
    description: '',
    imageUrl: '',
    price: 45.90,
    category: 'Importados',
  ),
  Product(
    id: 'prod-10',
    categoryId: 'cat-importados',
    brand: 'La Frontera',
    name: 'Chocolate Belga',
    description: '',
    imageUrl: '',
    price: 32.00,
    category: 'Importados',
  ),
];
