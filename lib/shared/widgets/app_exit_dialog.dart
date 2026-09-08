import 'dart:io';

import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';

class AppExitDialog extends StatelessWidget {
  const AppExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.power_settings_new, size: 80, color: AppColors.black),
      title: Text(
        'Você tem certeza?',
        style: AppTextStyle.tittle,
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 10),
      content: Text(
        'Você tem certeza que deseja sair do aplicativo? O aplicativo será totalmente fechado, dados serão perdidos.',
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: AppElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textButton: 'Não',
                type: ButtonType.outlined,
              ),
            ),
            Expanded(
              child: AppElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // fecha o Dialog
                  exit(0);
                },
                textButton: 'Sim',
                type: ButtonType.filled,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
