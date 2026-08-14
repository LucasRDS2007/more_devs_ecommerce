import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class RecoverController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  String email = '';
  bool isActiveButton = false;
  bool get isEmailValid => _emailRegex.hasMatch(email.trim());

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;

    return 'E-mail Inválido';
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid;
  }
}

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  static String route = '/recover';

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  RecoverController recoverController = RecoverController();

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Recuperar Senha', style: AppTextStyle.tittle),
                  SizedBox(height: 16),
                  AppTextField(
                    hintText: 'email@gmail.com',
                    errorText: recoverController.emailError,
                    onChanged: (value) {
                      setState(() {
                        recoverController.setEmail(value);
                      });
                    },
                  ),
                  Spacer(),
                  AppElevatedButton(
                    textButton: 'Continuar',
                    type: ButtonType.filled,
                    onPressed: recoverController.isActiveButton
                        ? () {
                            AnimatedSnackBar.material(
                              'Código enviado com sucesso',
                              type: AnimatedSnackBarType.success,
                              mobileSnackBarPosition:
                                  MobileSnackBarPosition.bottom,
                            ).show(context);
                          }
                        : null,
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
