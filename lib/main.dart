import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/pages/login_page.dart';
import 'package:more_devs_ecommerce/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: AppRoutes.routes, initialRoute: LoginPage.route);
  }
}
