import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveChecked = false;
  bool isActiveButton = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveChecked;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text('Criar uma conta', style: AppTextStyle.tittle),
              Text(
                'Insira seus dados para iniciar suas compras',
                style: AppTextStyle.subTittle,
              ),
              AppTextField(
                hintText: 'email@dominio.com',
                padding: EdgeInsets.only(bottom: 16, top: 16),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'nome',
                padding: EdgeInsets.only(bottom: 16),
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'senha',
                padding: EdgeInsets.only(bottom: 16),
                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'confirmar senha',
                onChanged: (value) {
                  setState(() {
                    confirmarSenha = value;
                  });
                },
              ),
              Spacer(),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Ao clicar em continuar, você concorda com os nossos\n',
                          style: AppTextStyle.smallGrey,
                        ),
                        TextSpan(
                          text: 'Termos de Serviço',
                          style: AppTextStyle.smallBlack,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Termos de Serviço');
                            },
                        ),
                        TextSpan(
                          text: ' e com a ',
                          style: AppTextStyle.smallGrey,
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
                ],
              ),
              SizedBox(height: 16),
              AppElevatedButton(
                type: ButtonType.filled,
                onPressed: () => {},
                textButton: 'Continuar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
