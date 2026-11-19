import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_ecommerce/features/home/controllers/home_controller.dart';
import 'package:more_devs_ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/features/signup/controllers/signup_controller.dart';
import 'package:more_devs_ecommerce/firebase_options.dart';
import 'package:more_devs_ecommerce/initializer.dart';
import 'package:more_devs_ecommerce/routes.dart';
import 'package:more_devs_ecommerce/shared/services/remote_config/remote_config_service.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await RemoteConfigService.instance.init();
  await WakelockPlus.enable();
  await Initializer.instance.getInitialRoute();
  

  runApp(const MainApp());
}

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
          initialRoute: Initializer.instance.initialRoute,
          onGenerateInitialRoutes: (initialRouteName) {
            final builder = AppRoutes.routes[initialRouteName]!;
            return [
              MaterialPageRoute(
                settings: RouteSettings(
                  name: initialRouteName,
                  arguments: Initializer.instance.message,
                ),
                builder: builder,
              ),
            ];
          },
        );
      },
    );
  }
}
