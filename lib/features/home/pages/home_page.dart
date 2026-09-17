import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/home/controllers/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_categorie_section.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_products_section.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_badge_cart_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_carousel.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_button_cart_page.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_exit_dialog.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_section_title.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>()
        ..getCategories()
        ..getProducts()
        ..getCarouselItens();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.power_settings_new, size: 30),
          onPressed: () {
            showDialog(context: context, builder: (_) => AppExitDialog());
          },
        ),
        centerTitle: true,
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá, ${loginController.user!.name}',
              style: AppTextStyle.title,
            );
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return Consumer<CartController>(
                builder: (context, cartController, child) {
                  return Visibility(
                    replacement: AppButtonCartPage(),
                    visible: cartController.getProductCartQuantity > 0,
                    child: AppBadgeCartButton(
                      quantity: cartController.getProductCartQuantity,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return SafeArea(
            child: Column(
              children: [
                AppCarousel(
                  controllerChangeIndex: homeController.changeCarouselIndex,
                  controllerIndex: homeController.activeIndex,
                  controllerCarouselViewState: homeController.carouselState,
                  controllerCarouselItens: homeController.carouselItens,
                ),
                AppSectionTitle(title: 'Categorias'),
                HomeCategorieSection(
                  controllerViewState: homeController.categoriesState,
                  controllerListCategories: homeController.categories,
                ),
                AppSectionTitle(title: 'Produtos'),
                HomeProductsSection(
                  controllerListProducts: homeController.products,
                  controllerViewState: homeController.productsState,
                  size: 150,
                ),

                //Produtos
              ],
            ),
          );
        },
      ),
    );
  }
}
