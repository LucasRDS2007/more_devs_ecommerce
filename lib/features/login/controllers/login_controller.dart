import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/login/models/user.dart';
import 'package:more_devs_ecommerce/shared/exceptions/auth_exceptions.dart';

class LoginController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;
  bool isActiveCheckBox = false;

  User? user;

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
      throw ErrorDescription('validação_incorreta');
    }

    changeIsLoading(true);
    try {
      await login();
      emailController.clear();
      senhaController.clear();
    } finally {
      changeIsLoading(false);
    }
    return;
  }

  Future<void> login() async {
    await Future.delayed(Duration(seconds: 2));
    if (emailController.text.trim() != 'Lucas@gmail.com' ||
        senhaController.text.trim() != '010203') {
      throw AuthException('E-mail ou senha Incorretos');
    }
    user = User(name: 'Lucas', email: emailController.text);
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
