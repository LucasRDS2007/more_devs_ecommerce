import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/features/recover/pages/recover_page.dart';
import 'package:more_devs_ecommerce/features/signup/pages/signup_page.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_checkbox.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();

  @override
  initState() {
    super.initState();
  }

  Future<void> login() async {
    setState(() {
      loginController.isLoading = true;
    });

    await loginController.login();

    setState(() {
      loginController.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Image(
                    image: AssetImage('assets/images/cadeado.png'),
                    height: 150,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '+DevsEcomm',
                    style: AppTextStyle.tittle,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 2),
                  AppTextField(
                    errorText: loginController.emailError,
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        loginController.setEmail(value);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    errorText: loginController.senhaError,
                    hintText: '****************',
                    obscureText: true,

                    onChanged: (value) {
                      setState(() {
                        loginController.setSenha(value);
                      });
                    },
                  ),
                  Row(
                    children: [
                      AppCheckbox(
                        loginController.isActiveCheckBox,
                        onChanged: (value) {
                          setState(() {
                            loginController.changeActiveCheckbox();
                          });
                        },
                      ),
                      Text('Lembrar-me'),
                    ],
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerEnd,
                    child: TextButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, RecoverPage.route),
                      },
                      child: Text(
                        'Esqueci minha senha',
                        style: AppTextStyle.smallBlack,
                      ),
                    ),
                  ),
                  AppElevatedButton(
                    onPressed: loginController.isActiveButton
                        ? () => login()
                        : null,
                    type: ButtonType.filled,
                    textButton: 'Entrar',
                    isLoading: loginController.isLoading,
                  ),
                  SizedBox(height: 16),
                  AppElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, SignupPage.route),
                    },
                    type: ButtonType.outlined,
                    textButton: 'Cadastrar-se',
                  ),

                  Spacer(flex: 2),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Termos de Serviço',
                          style: AppTextStyle.smallBlack,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: ' e ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Politicas de Privacidade',
                          style: AppTextStyle.smallBlack,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
