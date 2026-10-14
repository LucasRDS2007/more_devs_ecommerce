import 'package:flutter/material.dart';
import 'package:more_devs_ecommerce/features/signup/exceptions/signup_exception.dart';
import 'package:more_devs_ecommerce/features/signup/services/signup_service.dart';

enum SignupResult {
  success,
  validationError,
  termsNotAccepted,
  emailAlreadyExists,
  invalidData,
  connectionError,
  serverError,
}

class SignupController extends ChangeNotifier {
  final SignupService signupService = SignupService();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _nameRegex = RegExp(
    r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
  );
  final RegExp _senhaMaiuscula = RegExp(r'[A-Z]');
  final RegExp _senhaMinuscula = RegExp(r'[a-z]');
  final RegExp _senhaCaracterEspecial = RegExp(r'[^a-zA-Z0-9]');

  final int _caracterMinimoSenha = 6;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

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
      {'No mínimo uma letra maiúscula': isSenhaMaiusculo},
      {'No mínimo uma letra minúscula': isSenhaMinusculo},
      {'Senhas coincidem': isConfirmedSenha},
    ];
  }

  Future<SignupResult> hadleSignup() async {
    if (!key.currentState!.validate()) {
      return SignupResult.validationError;
    }

    if (!isActiveChecked) {
      errorCheckbox = true;
      notifyListeners();
      return SignupResult.termsNotAccepted;
    }

    errorCheckbox = null;
    isLoading = true;
    notifyListeners();

    try {
      await signupService.registerUser(
        nomeController.text.trim(),
        emailController.text.trim(),
        senha,
        confirmarSenha,
        isActiveChecked,
      );
      return SignupResult.success;
    } on SignupException catch (e) {
      switch (e.type) {
        case SignupExceptionType.emailAlreadyExists:
          return SignupResult.emailAlreadyExists;
        case SignupExceptionType.invalidData:
          return SignupResult.invalidData;
        case SignupExceptionType.connectionError:
          return SignupResult.connectionError;
        case SignupExceptionType.serverError:
          return SignupResult.serverError;
      }
    } catch (e) {
      return SignupResult.serverError;
    } finally {
      isLoading = false;
      notifyListeners();
    }
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

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email é obrigatório';
    }
    if (!_emailRegex.hasMatch(email)) {
      return 'Email inválido';
    }
    return null;
  }

  String? validateNome(String? value) {
    final nome = value?.trim() ?? '';
    if (nome.isEmpty) {
      return 'Nome é obrigatório';
    }
    if (!_nameRegex.hasMatch(nome)) {
      return 'Nome inválido';
    }
    return null;
  }

  String? validateSenha(String? value) {
    final senhaValue = value ?? '';
    if (senhaValue.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (!isSenhaValid) {
      return 'Falta algum requisito de senha';
    }
    return null;
  }

  String? validateConfirmarSenha(String? value) {
    final confirmarSenhaValue = value ?? '';
    if (confirmarSenhaValue.isEmpty) {
      return 'Confirmação de senha é obrigatória';
    }
    if (confirmarSenhaValue != senha) {
      return 'Senhas não coincidem';
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    nomeController.dispose();
    super.dispose();
  }
}
