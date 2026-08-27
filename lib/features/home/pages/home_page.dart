import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/home/controlles/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/untils.dart';
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
  Untils untils = Untils();

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
                  //Carrossel
                  AppSectionTitle(title: 'Categorias'),
                  SizedBox(
                    child: switch (homeController.categoriesState) {
                      CategoriesViewState.loading =>
                        CircularProgressIndicator(),
                      CategoriesViewState.error => Text(
                        'Problema ao resgatar categorias',
                      ),
                      CategoriesViewState.sucess => SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: homeController.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Category category =
                                homeController.categories[index];
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                              child: Column(
                                children: [
                                  Image.network(category.imageUrl.toString()),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      category.name.toString(),
                                      style: AppTextStyle.subTittle,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    },
                  ),
                  AppSectionTitle(title: 'Produtos'),
                  SizedBox(
                    child: switch (homeController.productsState) {
                      ProductsViewState.loading => CircularProgressIndicator(),
                      ProductsViewState.error => Text(
                        'Problema ao resgatar produtos',
                      ),
                      ProductsViewState.sucess => SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: homeController.products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Product product = homeController.products[index];
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(product.imageUrl.toString()),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      product.brand.toString(),
                                      style: AppTextStyle.smallGrey,
                                    ),
                                  ),
                                  Text(
                                    product.name.toString(),
                                    style: AppTextStyle.subTittle,
                                  ),
                                  Text(
                                    untils.formatCurrency(product.price),
                                    style: AppTextStyle.tittle,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    },
                  ),
                  AppElevatedButton(
                    textButton: 'textButton',
                    type: ButtonType.filled,
                    onPressed: () {
                      homeController.getCategories();
                      homeController.getProducts();
                    },
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
