import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/login/controllers/login_controller.dart';
import 'package:more_devs_ecommerce/features/recover/pages/recover_page.dart';
import 'package:more_devs_ecommerce/features/signup/pages/signup_page.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_checkbox.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Consumer<LoginController>(
          builder: (context, controller, child) {
            return SafeArea(
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
                          controller: controller.emailController,
                          validator: (value) {
                            return controller.validateEmail(value);
                          },
                          hintText: 'email@dominio.com',
                        ),
                        SizedBox(height: 16),
                        AppTextField(
                          controller: controller.senhaController,
                          validator: (value) {
                            return controller.validateSenha(value);
                          },
                          hintText: '****************',
                          obscureText: true,
                        ),
                        Row(
                          children: [
                            AppCheckbox(
                              controller.isActiveCheckBox,
                              onChanged: (value) {
                                controller.changeActiveCheckbox();
                                ;
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
                          onPressed: () {
                            controller.handleLogin();
                          },
                          type: ButtonType.filled,
                          textButton: 'Entrar',
                          isLoading: controller.isLoading,
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
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              TextSpan(
                                text: ' e ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: 'Politicas de Privacidade',
                                style: AppTextStyle.smallBlack,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
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
            );
          },
        ),
      ),
    );
  }
}
