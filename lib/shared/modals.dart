import 'package:flutter/material.dart';

class Modals {
  static Future<T?> appBottomSheet<T>(BuildContext context, Widget body) {
    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return SafeArea(child: SingleChildScrollView(child: body));
      },
    );
  }

  static Future<T?> confirmationDialogAlert<T>(
    BuildContext context, {
    required Widget body,
  }) async {
    return await showDialog<T>(context: context, builder: (_) => body);
  }
}
