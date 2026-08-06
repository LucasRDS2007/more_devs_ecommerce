import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/pages/signup_page.dart';
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
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
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
              AppTextField(
                hintText: 'email@dominio.com',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 16),
              AppTextField(
                hintText: '****************',
                obscureText: true,

                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              Row(
                children: [
                  AppCheckbox(
                    isActiveCheckBox,
                    onChanged: (value) {
                      setState(() {
                        isActiveCheckBox = !isActiveCheckBox;
                      });
                    },
                  ),
                  Text('Lembrar-me'),
                ],
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
                onPressed: isActiveButton
                    ? () {
                        print('cliquei em entrar');
                      }
                    : null,
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
