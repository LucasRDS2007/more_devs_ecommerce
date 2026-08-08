class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => senha.trim().length >= _caracterMinimoSenha;

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;

    return 'E-mail Inválido';
  }

  String? get senhaError {
    if (senha.isEmpty || isSenhaValid) {
      return null;
    }

    return 'Senha Inválida';
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid && isSenhaValid;
  }

  void changeActiveCheckbox() {
    isActiveCheckBox = !isActiveCheckBox;
  }
}
