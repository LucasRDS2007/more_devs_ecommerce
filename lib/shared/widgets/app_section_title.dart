import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';

class AppSectionTitle extends StatelessWidget {
  const AppSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(title, style: AppTextStyle.tittle),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.grey100,
            ),
            child: Icon(Icons.arrow_forward_ios, size: 12),
          ),
        ],
      ),
    );
  }
}
