import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';
import 'package:more_devs_ecommerce/shared/services/analytics/analytics_mixin.dart';

class BlockPage extends StatefulWidget {
  const BlockPage({ super.key, required this.message });

  static String route = '/block';
  final String message;

  @override
  State<BlockPage> createState() => _BlockPageState();
}

class _BlockPageState extends State<BlockPage> with AnalyticsMixin<BlockPage>{
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.block, size: 50, color: AppColors.black),
                const SizedBox(height: 16),
                Text(
                  widget.message,
                  style: AppTextStyle.title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  String get screenName => BlockPage.route;
}