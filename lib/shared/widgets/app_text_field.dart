import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.padding,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.controller,
  });

  final String hintText;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  void toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.all(0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUnfocus,
        onChanged: widget.onChanged,
        obscureText: isObscure,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    toggleObscure();
                  },
                  icon: isObscure
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintText: widget.hintText,
          hintStyle: AppTextStyle.smallGrey,
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
        cursorWidth: 0.7,
        cursorColor: AppColors.black,
      ),
    );
  }
}
