import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle smallBlack = TextStyle(color: AppColors.black);
  static TextStyle smallerBlack = TextStyle(
    color: AppColors.black,
    fontSize: 12,
  );
  static TextStyle smallGrey = TextStyle(color: AppColors.grey);
  static TextStyle smallerGrey = TextStyle(color: AppColors.grey, fontSize: 12);
  static TextStyle tittle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subTittle = TextStyle(color: AppColors.black, fontSize: 16);
  static TextStyle buttonLabel = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle passwordRequirementValid = TextStyle(
    color: AppColors.green,
    fontWeight: FontWeight.bold,
  );
  static TextStyle passwordRequirementInValid = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
}
