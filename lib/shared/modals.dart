import 'package:flutter/material.dart';

class Modals {
  Future<dynamic> appBottomSheet(context, Widget body) {
    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return body;
      },
    );
  }
}
