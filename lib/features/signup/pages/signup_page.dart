import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/signup/controllers/signup_controller.dart';
import 'package:more_devs_ecommerce/shared/app_snack_bar.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_checkbox.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignupController>(
        builder: (context, controller, child) {
          return Form(
            key: controller.key,
            child: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
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
                          validator: (value) {
                            return controller.validateEmail(value);
                          },
                          hintText: 'email@dominio.com',
                          padding: EdgeInsets.only(bottom: 16, top: 16),
                          controller: controller.emailController,
                        ),
                        AppTextField(
                          validator: (value) {
                            return controller.validateNome(value);
                          },
                          hintText: 'nome',
                          padding: EdgeInsets.only(bottom: 16),
                          controller: controller.nomeController,
                        ),
                        AppTextField(
                          validator: (value) {
                            return controller.validateSenha(value);
                          },
                          onChanged: (value) {
                            controller.setSenha(value);
                          },
                          hintText: 'senha',
                          padding: EdgeInsets.only(bottom: 16),
                          obscureText: true,
                        ),
                        AppTextField(
                          validator: (value) {
                            return controller.validateConfirmarSenha(value);
                          },
                          onChanged: (value) {
                            controller.setConfirmarSenha(value);
                          },
                          hintText: 'confirmar senha',
                          padding: EdgeInsets.only(bottom: 16),
                          obscureText: true,
                        ),
                        SizedBox(height: 16),
                        Column(
                          spacing: 8,
                          children: [
                            for (var requirement
                                in controller.getPasswordRequirements())
                              AppPasswordRequirement(
                                label: requirement.keys.first,
                                isValid: requirement.values.first,
                              ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            AppCheckbox(
                              errorValue: controller.errorCheckbox,
                              controller.isActiveChecked,
                              onChanged: (value) {
                                controller.changeActiveCheckbox();
                              },
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Para continuar, confirme e concorde com os nossos\n',
                                    style: AppTextStyle.smallerGrey,
                                  ),
                                  TextSpan(
                                    text: 'Termos de Serviço',
                                    style: AppTextStyle.smallerBlack,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  TextSpan(
                                    text: ' e com a ',
                                    style: AppTextStyle.smallerGrey,
                                  ),
                                  TextSpan(
                                    text: 'Politicas de Privacidade',
                                    style: AppTextStyle.smallerBlack,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        AppElevatedButton(
                          type: ButtonType.filled,
                          onPressed: () async {
                            try {
                              await controller.hadleSignup();
                            } catch (e) {
                              if (e is ErrorDescription) {
                                AppSnackBar.error(
                                  context,
                                  'Confirme os Termos de Serviço e a Política de Privacidade para continuar.',
                                );
                              }
                            }
                          },
                          textButton: 'Continuar',
                          isLoading: controller.isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
