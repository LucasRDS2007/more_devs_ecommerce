import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_categorie_section.dart';
import 'package:more_devs_ecommerce/features/home/widgets/home_products_section.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
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
        ..getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá, ${loginController.user!.name}',
              style: AppTextStyle.tittle,
            );
          },
        ),
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // AppElevatedButton(
                  //   textButton: 'textButton',
                  //   type: ButtonType.filled,
                  //   onPressed: () {
                  //     homeController.getCategories();
                  //     homeController.getProducts();
                  //   },
                  // ),

                  //Carrossel
                  AppSectionTitle(title: 'Categorias'),
                  HomeCategorieSection(
                    controllerViewState: homeController.categoriesState,
                    controllerListCategories: homeController.categories,
                  ),
                  AppSectionTitle(title: 'Produtos'),
                  HomeProductsSection(
                    controllerListProducts: homeController.products,
                    controllerViewState: homeController.productsState,
                  ),

                  //Produtos
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
