import 'package:flutter/material.dart';

class AppPasswordRequirement extends StatelessWidget {
  const AppPasswordRequirement({
    super.key,
    required this.label,
    required this.isValid,
  });

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(Icons.check_circle, color: isValid ? Colors.green : Colors.black),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isValid ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
