import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static void success(BuildContext snackContext, String message) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(snackContext);
  }

  static void error(BuildContext snackContext, String message) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(snackContext);
  }

  static void info(BuildContext snackContext, String message) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.info,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(snackContext);
  }
}
