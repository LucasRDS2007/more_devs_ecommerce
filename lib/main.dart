import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/home/controllers/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/features/login/pages/login_page.dart';
import 'package:more_devs_ecommerce/features/signup/controllers/signup_controller.dart';
import 'package:more_devs_ecommerce/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

//as
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return LoginController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SignupController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return HomeController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductsByCategoryController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CartController();
          },
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          routes: AppRoutes.routes,
          initialRoute: LoginPage.route,
        );
      },
    );
  }
}
