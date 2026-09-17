import 'package:flutter/material.dart';

class Modals {
  Future<dynamic> appBottomSheet(BuildContext context, Widget body) {
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
    required Widget boody,
  }) async {
    return await showDialog<T>(context: context, builder: (_) => boody);
  }
}
