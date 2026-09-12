import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';

class CartController extends ChangeNotifier {
  List<ProductCart> productCartList = [
    ProductCart(
      brand: 'Akatsu',
      name: 'Acerola',
      imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
      price: 7.99,
      category: 'Frutas',
      quantity: 1,
    ),
    ProductCart(
      brand: 'Natural da Terra',
      name: 'Maçã',
      imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      price: 8.49,
      category: 'Frutas',
      quantity: 5,
    ),
    ProductCart(
      brand: 'Natural da Terra',
      name: 'Banana',
      imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
      price: 6.99,
      category: 'Frutas',
      quantity: 2,
    ),
    ProductCart(
      brand: 'Natural da Terra',
      name: 'Rabanete',
      imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      price: 10.99,
      category: 'Verduras',
      quantity: 1,
    ),
  ];
  //TODO decrement recebe produto por parametro, encontra o item na lista productCartList, incrementa quantity e atualiza a lista
}
