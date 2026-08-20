import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/recover/controllers/recover_controller.dart';
import 'package:more_devs_ecommerce/shared/app_snack_bar.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_text_field.dart';

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
                            AppSnackBar.success(
                              context,
                              'Código enviado com sucesso',
                            );
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
