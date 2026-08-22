import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _nameRegex = RegExp(
    r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
  );
  final RegExp _senhaMaiuscula = RegExp(r'[A-Z]');
  final RegExp _senhaMinuscula = RegExp(r'[a-z]');
  final RegExp _senhaCaracterEspecial = RegExp(r'[^a-zA-Z0-9]');
  final int _caracterMinimoSenha = 6;
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  String senha = '';
  String confirmarSenha = '';
  bool isActiveChecked = false;
  bool? errorCheckbox;
  bool isActiveButton = false;
  bool isLoading = false;

  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isNomeValid => _nameRegex.hasMatch(nomeController.text.trim());
  bool get isSenhaCaracterMinimo => senha.trim().length >= _caracterMinimoSenha;
  bool get isSenhaMaiusculo => _senhaMaiuscula.hasMatch(senha.trim());
  bool get isSenhaMinusculo => _senhaMinuscula.hasMatch(senha.trim());
  bool get isSenhaCaracterEspecial =>
      _senhaCaracterEspecial.hasMatch(senha.trim());
  bool get isConfirmedSenha =>
      confirmarSenha.isNotEmpty && confirmarSenha == senha;

  bool get isSenhaValid =>
      isSenhaCaracterMinimo &&
      isSenhaMaiusculo &&
      isSenhaMinusculo &&
      isSenhaCaracterEspecial;

  List<Map<String, bool>> getPasswordRequirements() {
    return [
      {'Mínimo de 6 caracteres': isSenhaCaracterMinimo},
      {'No mínimo um caracter especial': isSenhaCaracterEspecial},
      {'No mínimo uma letra maiscula': isSenhaMaiusculo},
      {'No mínimo uma letra minuscula': isSenhaMinusculo},
      {'Senhas coincidem': isConfirmedSenha},
    ];
  }

  Future<void> hadleSignup() async {
    if (key.currentState!.validate()) {
      if (snackCheckError()) {
        errorCheckbox = true;
        notifyListeners();
        throw ErrorDescription('not_found');
      }

      isLoading = true;
      notifyListeners();
    }
    await signup();
    notifyListeners();

    isLoading = false;
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    notifyListeners();
  }

  void setConfirmarSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
    notifyListeners();
  }

  void changeActiveCheckbox() {
    isActiveChecked = !isActiveChecked;
    if (isActiveChecked) {
      errorCheckbox = null;
    }
    notifyListeners();
  }

  Future<void> signup() async {
    await Future.delayed(Duration(seconds: 2));
  }

  String? validateEmail(String? value) {
    if (isEmailValid) {
      return null;
    }
    return 'Email inválido';
  }

  String? validateNome(String? value) {
    if (isNomeValid) {
      return null;
    }
    return 'Nome invalido';
  }

  String? validateSenha(String? value) {
    if (!isSenhaValid) {
      return 'Falta algum requisito de senha';
    }
    return null;
  }

  String? validateConfirmarSenha(String? value) {
    if (!isConfirmedSenha) {
      return 'Senhas não coincidem';
    }
    return null;
  }

  bool snackCheckError() {
    if (!isActiveChecked) {
      return true;
    }
    return false;
  }
}
