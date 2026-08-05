import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/pages/signup_page.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              AppTextField(hintText: 'email@dominio.com'),
              SizedBox(height: 16),
              AppTextField(
                hintText: '*********************',
                obscureText: true,
              ),
              Align(
                alignment: AlignmentGeometry.centerEnd,
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Esqueci minha senha',
                    style: AppTextStyle.smallBlack,
                  ),
                ),
              ),
              AppElevatedButton(
                onPressed: () => {},
                type: ButtonType.filled,
                textButton: 'Entrar',
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
                        ..onTap = () {
                          print('Termos de Serviço');
                        },
                    ),
                    TextSpan(
                      text: ' e ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'Politicas de Privacidade',
                      style: AppTextStyle.smallBlack,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Politicas de Privacidade');
                        },
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
