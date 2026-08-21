import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;
  bool isActiveCheckBox = false;

  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid =>
      senhaController.text.trim().length >= _caracterMinimoSenha;

  void changeActiveCheckbox() {
    isActiveCheckBox = !isActiveCheckBox;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (key.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
    }

    await login();

    isLoading = false;
    notifyListeners();
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
