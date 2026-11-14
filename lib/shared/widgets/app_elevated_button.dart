import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/shared/analytics/analytics_mixin.dart';
import 'package:more_devs_ecommerce/shared/app_colors.dart';
import 'package:more_devs_ecommerce/shared/app_text_style.dart';

enum ButtonType { filled, outlined }

class ButtonAnalytics{
  final String buttonName;
  final String? screenName;
  final Map<String, Object>? parameters;
  ButtonAnalytics(this.buttonName, this.screenName, {  this.parameters});
}

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
    super.key,
    required this.textButton,
    required this.type,
    required this.onPressed,
    this.isLoading = false, this.buttonAnalytics,
  });

  final String textButton;
  final VoidCallback? onPressed;
  final ButtonAnalytics? buttonAnalytics;
  final bool isLoading;
  final ButtonType type;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> with AnalyticsMixin<AppElevatedButton>{
  ButtonStyle _getButtonStyle() {
    switch (widget.type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        );

      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
            side: BorderSide(color: AppColors.black, width: 2),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed == null
          ? null
          : () {
              final analytics = widget.buttonAnalytics;
              if (analytics != null ) {
               logButtonClick(
                  analytics.buttonName,
                  analytics.parameters
               );
              }
              widget.onPressed!();
            },
      style: _getButtonStyle(),
      child: widget.isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 3,
              ),
            )
          : Text(widget.textButton),
    );
  }

  @override
  // TODO: implement screenName
  String get screenName => widget.buttonAnalytics?.screenName ?? '';
}
