import 'package:flutter/material.dart';

class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool isLoading = false;
  bool isActiveCheckBox = false;

  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid =>
      senhaController.text.trim().length >= _caracterMinimoSenha;

  void changeActiveCheckbox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  Future<void> login() async {
    await Future.delayed(Duration(seconds: 2));
  }

  String? validateEmail(String? value) {
    if (isEmailValid) {
      return null;
    }
    return 'Email inválido';
  }

  String? validateSenha(String? value) {
    if (isSenhaValid) {
      return null;
    }
    return 'Senha invalida';
  }
}
