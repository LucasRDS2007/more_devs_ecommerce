import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_section_title.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();

    context.read<HomeController>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text('Olá, ${loginController.user!.name}');
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
                  //Carrossel
                  AppSectionTitle(title: 'Categorias'),
                  SizedBox(
                    height: 108,
                    child: switch (homeController.categoriesState) {
                      CategoriesViewState.loading =>
                        CircularProgressIndicator(),
                      CategoriesViewState.error => Text(
                        'Problema ao resgatar categorias',
                      ),
                      CategoriesViewState.sucess => Container(
                        color: AppColors.red,
                        width: 100,
                        height: 100,
                      ),
                    },
                  ),
                  AppSectionTitle(title: 'Produtos'),
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
