import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/pages/cart_page.dart';
import 'package:more_devs_ecommerce/features/home/pages/home_page.dart';
import 'package:more_devs_ecommerce/features/home/pages/products_by_category_page.dart';
import 'package:more_devs_ecommerce/features/login/pages/login_page.dart';
import 'package:more_devs_ecommerce/features/recover/pages/recover_page.dart';
import 'package:more_devs_ecommerce/features/signup/pages/signup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    RecoverPage.route: (context) => RecoverPage(),
    HomePage.route: (context) => HomePage(),
    CartPage.route: (context) => CartPage(),
    ProductsByCategoryPage.route: (context) {
      final categoryName = ModalRoute.of(context)!.settings.arguments as String;
      return ProductsByCategoryPage(categoryName: categoryName);
    },
  };
}
