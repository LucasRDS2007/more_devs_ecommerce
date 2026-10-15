import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/login/models/auth_user.dart';
import 'package:more_devs_ecommerce/shared/exceptions/auth_exceptions.dart';

class LoginController extends ChangeNotifier {
  LoginService loginService = LoginService();
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;
  bool isActiveCheckBox = false;

  AuthUser? authUser;

  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid =>
      senhaController.text.trim().length >= _caracterMinimoSenha;

  void changeActiveCheckbox() {
    isActiveCheckBox = !isActiveCheckBox;
    notifyListeners();
  }

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (!key.currentState!.validate()) {
      return;
    }

    changeIsLoading(true);
    try {
      await loginService.loginUser(
        emailController.text.trim(),
        senhaController.text.trim(),
      );
      emailController.clear();
      senhaController.clear();
    } finally {
      changeIsLoading(false);
    }
    return;
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
