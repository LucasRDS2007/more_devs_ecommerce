import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text('Olá, ${loginController.user!.name}');
          },
        ),
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(),
              Row(children: [Text('Categorias'), Icon(Icons.abc_sharp)]),
            ],
          ),
        ),
      ),
    );
  }
}
