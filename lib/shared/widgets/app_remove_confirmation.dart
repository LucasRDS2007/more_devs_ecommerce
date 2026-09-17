import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/widgets/app_elevated_button.dart';

class AppRemoveConfirmation extends StatelessWidget {
  const AppRemoveConfirmation({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.remove_shopping_cart_outlined,
        size: 80,
        color: AppColors.black,
      ),
      title: Text(title, style: AppTextStyle.title),
      content: Text(content, style: AppTextStyle.smallBlack),
      actions: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: AppElevatedButton(
                textButton: 'Não',
                type: ButtonType.outlined,
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
            Expanded(
              child: AppElevatedButton(
                textButton: 'Sim',
                type: ButtonType.filled,
                onPressed: () => Navigator.pop(context, true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
