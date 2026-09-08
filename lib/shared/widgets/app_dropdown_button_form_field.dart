import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';

class AppDropdownButtonFormField extends StatelessWidget {
  const AppDropdownButtonFormField({
    super.key,
    required this.selectedBrand,
    required this.brandsProducts,
    required this.onChanged,
  });

  final String selectedBrand;
  final List<String> brandsProducts;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey100),
        ),
      ),
      initialValue: selectedBrand,
      items: [
        DropdownMenuItem(
          value: '',
          child: Text('Toda as Marcas', style: AppTextStyle.smallGrey),
        ),
        ...brandsProducts.map(
          (item) => DropdownMenuItem(
            value: item,
            child: Text(item, style: AppTextStyle.smallGrey),
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
