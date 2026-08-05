import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/pages/login_page.dart';
import 'package:more_devs_ecommerce/pages/signup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
  };
}
