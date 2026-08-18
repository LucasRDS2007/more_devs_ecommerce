import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/signup/controllers/signup_controller.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_checkbox.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupController signupController = SignupController();

  @override
  initState() {
    super.initState();
  }

  Future<void> signup() async {
    setState(() {
      signupController.isLoading = true;
    });

    await signupController.signup();

    setState(() {
      signupController.isLoading = false;
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
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text('Criar uma conta', style: AppTextStyle.tittle),
                  Text(
                    'Insira seus dados para iniciar suas compras',
                    style: AppTextStyle.subTittle,
                  ),
                  AppTextField(
                    errorText: signupController.emailError,
                    hintText: 'email@dominio.com',
                    padding: EdgeInsets.only(bottom: 16, top: 16),
                    onChanged: (value) {
                      setState(() {
                        signupController.setEmail(value);
                      });
                    },
                  ),
                  AppTextField(
                    errorText: signupController.nomeError,
                    hintText: 'nome',
                    padding: EdgeInsets.only(bottom: 16),
                    onChanged: (value) {
                      setState(() {
                        signupController.setNome(value);
                      });
                    },
                  ),
                  AppTextField(
                    onChanged: (value) {
                      setState(() {
                        signupController.setSenha(value);
                      });
                    },
                    hintText: 'senha',
                    padding: EdgeInsets.only(bottom: 16),
                    obscureText: true,
                  ),
                  AppTextField(
                    onChanged: (value) {
                      setState(() {
                        signupController.setConfirmarSenha(value);
                      });
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
                          in signupController.getPasswordRequirements())
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
                        signupController.isActiveChecked,
                        onChanged: (value) {
                          setState(() {
                            signupController.changeActiveCheckbox();
                          });
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
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: ' e com a ',
                              style: AppTextStyle.smallerGrey,
                            ),
                            TextSpan(
                              text: 'Politicas de Privacidade',
                              style: AppTextStyle.smallerBlack,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AppElevatedButton(
                    type: ButtonType.filled,
                    onPressed: signupController.isActiveButton
                        ? () => signup()
                        : null,
                    textButton: 'Continuar',
                    isLoading: signupController.isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
