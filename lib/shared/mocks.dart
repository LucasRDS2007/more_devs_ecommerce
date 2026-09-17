import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';

final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {'name': 'Verduras', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
];

final List<Map<String, dynamic>> productsJson = [
  // =========================
  // FRUTAS
  // =========================
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'description':
        'A acerola é uma fruta tropical conhecida pelo seu sabor refrescante, levemente ácido e naturalmente adocicado. Rica em vitamina C e muito versátil, pode ser consumida in natura, utilizada em sucos, vitaminas, sobremesas e diversas receitas. Ideal para quem busca uma opção saborosa e nutritiva para o dia a dia. Produto selecionado para garantir qualidade, frescor e sabor. ',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
    'category': 'Frutas',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Maçã',
    'description':
        'A maçã é uma fruta conhecida pela textura crocante, sabor levemente adocicado e aroma agradável. Uma opção prática e versátil para consumir ao longo do dia, podendo ser apreciada in natura ou utilizada em saladas, sobremesas, tortas, sucos e outras receitas. Selecionada cuidadosamente para oferecer frescor, qualidade e uma experiência saborosa em cada mordida.',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 8.49,
    'category': 'Frutas',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Banana',
    'description':
        'A banana é uma fruta naturalmente doce, macia e muito versátil, ideal para diferentes momentos do dia. Pode ser consumida pura, adicionada a vitaminas e saladas de frutas ou utilizada no preparo de bolos, sobremesas e outras receitas. Uma escolha prática e saborosa para complementar a alimentação diária. Produto selecionado para garantir qualidade e frescor.',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 6.99,
    'category': 'Frutas',
  },

  // =========================
  // VERDURAS
  // =========================
  {
    'brand': 'Natural da Terra',
    'name': 'Rabanete',
    'description':
        'O rabanete é um vegetal de sabor levemente picante, textura crocante e aparência característica, muito utilizado em saladas e acompanhamentos. Seu frescor combina com diferentes preparações e pode trazer mais sabor e variedade às refeições. Ideal para quem procura ingredientes versáteis para o dia a dia. Produto selecionado para garantir qualidade, crocância e frescor.',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 10.99,
    'category': 'Verduras',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Cogumelo',
    'description':
        'Os cogumelos são ingredientes versáteis, conhecidos pela textura macia e pelo sabor marcante que combina com diferentes tipos de pratos. Podem ser preparados salteados, grelhados, utilizados em massas, risotos, molhos e diversas outras receitas. Uma excelente opção para acrescentar sabor e variedade à cozinha. Produto selecionado para garantir qualidade e frescor.',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
    'category': 'Verduras',
  },
  {
    'brand': 'Natural da Terra',
    'name': 'Alface',
    'description':
        'A alface é uma hortaliça leve e refrescante, muito presente em saladas e acompanhamentos do dia a dia. Com folhas delicadas e textura crocante, combina facilmente com outros vegetais, molhos e diferentes ingredientes. Uma opção prática para preparar refeições frescas e equilibradas. Produto selecionado para garantir folhas frescas, qualidade e sabor.',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 5.49,
    'category': 'Verduras',
  },

  // =========================
  // PADARIA
  // =========================
  {
    'brand': 'Padaria do Bairro',
    'name': 'Pão Francês',
    'description':
        'O pão francês é um clássico da padaria brasileira, conhecido pela casca dourada e crocante e pelo interior macio e leve. Perfeito para o café da manhã, lanches ou para acompanhar refeições, pode ser consumido puro ou combinado com manteiga, frios, queijos e outros ingredientes. Produzido para oferecer aquele sabor tradicional de pão fresquinho.',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 9.99,
    'category': 'Padaria',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Pão de Forma',
    'description':
        'O pão de forma possui textura macia e sabor suave, sendo uma opção prática para preparar sanduíches, torradas e diferentes lanches. Sua versatilidade permite combinar o produto com ingredientes doces ou salgados, tornando-o ideal para diversas ocasiões. Uma escolha conveniente para manter em casa e preparar refeições rápidas e saborosas.',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 12.49,
    'category': 'Padaria',
  },
  {
    'brand': 'Padaria do Bairro',
    'name': 'Croissant',
    'description':
        'O croissant é um clássico da panificação, reconhecido por suas camadas delicadas, textura leve e sabor amanteigado. Ideal para acompanhar cafés, chás ou outras bebidas, também pode ser servido em lanches e diferentes momentos do dia. Uma opção especial para quem aprecia produtos de padaria com textura crocante por fora e macia por dentro.',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 8.99,
    'category': 'Padaria',
  },

  // =========================
  // IMPORTADOS
  // =========================
  {
    'brand': 'Ferrero',
    'name': 'Nutella',
    'description':
        'Nutella é um creme de avelã com cacau reconhecido por sua textura cremosa e sabor marcante. Versátil e fácil de combinar, pode ser utilizado em pães, torradas, panquecas, frutas, sobremesas e diversas receitas. Ideal para transformar momentos simples em experiências mais saborosas. Uma opção prática para ter em casa e aproveitar no café da manhã ou nos lanches.',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 29.99,
    'category': 'Importados',
  },
  {
    'brand': 'Lindt',
    'name': 'Chocolate Lindt',
    'description':
        'O chocolate Lindt combina ingredientes selecionados com uma textura cremosa e sabor intenso, característica da tradição da marca na produção de chocolates. Ideal para apreciar individualmente ou compartilhar em momentos especiais, também pode acompanhar cafés e sobremesas. Uma opção para quem busca uma experiência diferenciada e um chocolate de qualidade.',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 24.99,
    'category': 'Importados',
  },
  {
    'brand': 'Pringles',
    'name': 'Batata Pringles',
    'description':
        'Pringles é um snack conhecido pelo formato característico, textura crocante e sabor marcante. Prática para consumir em diferentes ocasiões, é uma opção para lanches, encontros com amigos ou momentos de descontração. Pode ser servida individualmente ou compartilhada. Uma escolha conveniente para quem procura um snack crocante e saboroso para qualquer momento.',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 18.99,
    'category': 'Importados',
  },
];

final List<Map<String, dynamic>> carouselJson = [
  {
    'title': 'Aproveite as ofertas',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
  },
  {
    'title': 'Experimente agora!',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
  },
  {
    'title': 'Compre Compre Compre!',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
  },
];

final List<Category> fakeLoadingCategories = [
  Category(name: 'Frutas', imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png'),
  Category(
    name: 'Verduras',
    imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
  ),
  Category(
    name: 'Padaria',
    imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
  ),
  Category(
    name: 'Importados',
    imageUrl: 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
  ),
];

final List<Product> fakeLoadingProducts = [
  Product(
    brand: 'Natural da terra',
    name: 'Rabanete',
    description: '',
    imageUrl: '',
    price: 10.99,
    category: 'Verduras',
  ),
  Product(
    brand: 'Natural da terra',
    name: 'Cogumelo',
    description: '',
    imageUrl: '',
    price: 12.19,
    category: 'Verduras',
  ),
  Product(
    brand: 'Natural da terra',
    name: 'Alface',
    description: '',
    imageUrl: '',
    price: 4.50,
    category: 'Verduras',
  ),
  Product(
    brand: 'Akatsu',
    name: 'Acerola',
    description: '',
    imageUrl: '',
    price: 7.99,
    category: 'Frutas',
  ),
  Product(
    brand: 'Akatsu',
    name: 'Banana',
    description: '',
    imageUrl: '',
    price: 6.29,
    category: 'Frutas',
  ),
  Product(
    brand: 'Akatsu',
    name: 'Morango',
    description: '',
    imageUrl: '',
    price: 9.90,
    category: 'Frutas',
  ),
  Product(
    brand: 'Pão & Cia',
    name: 'Pão francês',
    description: '',
    imageUrl: '',
    price: 15.00,
    category: 'Padaria',
  ),
  Product(
    brand: 'Pão & Cia',
    name: 'Baguete',
    description: '',
    imageUrl: '',
    price: 8.75,
    category: 'Padaria',
  ),
  Product(
    brand: 'La Frontera',
    name: 'Queijo Manchego',
    description: '',
    imageUrl: '',
    price: 45.90,
    category: 'Importados',
  ),
  Product(
    brand: 'La Frontera',
    name: 'Chocolate Belga',
    description: '',
    imageUrl: '',
    price: 32.00,
    category: 'Importados',
  ),
];
