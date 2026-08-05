import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  Widget build(BuildContext context) {
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
              ),

              AppTextField(
                hintText: 'nome',
                padding: EdgeInsets.only(bottom: 16),
              ),
              AppTextField(
                hintText: 'senha',
                padding: EdgeInsets.only(bottom: 16),
              ),
              AppTextField(hintText: 'confirmar senha'),
              Spacer(),
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
                    TextSpan(text: ' e com a ', style: AppTextStyle.smallGrey),
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
