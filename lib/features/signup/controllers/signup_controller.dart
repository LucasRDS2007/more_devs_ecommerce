class SignupController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _nameRegex = RegExp(
    r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
  );
  final int _caracterMinimoSenha = 6;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveChecked = false;
  bool isActiveButton = false;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isNomeValid => _nameRegex.hasMatch(nome.trim());
  bool get isSenhaValid => senha.trim().length >= _caracterMinimoSenha;
  bool isConfirmedSenha = false;

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;

    return 'E-mail Inválido';
  }

  String? get nomeError {
    if (nome.isEmpty || isNomeValid) {
      return null;
    }
    return 'Nome Inválido';
  }

  String? get senhaError {
    if (senha.isEmpty || isSenhaValid) {
      return null;
    }

    return 'Senha Inválida';
  }

  String? get confirmarSenhaError {
    if (confirmarSenha.isEmpty || confirmarSenha == senha) {
      isConfirmedSenha = true;
      return null;
    }

    return 'Senhas não coincidem';
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setNome(String nomeParam) {
    nome = nomeParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void setConfirmarSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
  }

  void changeActiveButton() {
    isActiveButton =
        isEmailValid &&
        isNomeValid &&
        isSenhaValid &&
        isActiveChecked &&
        isConfirmedSenha;
  }

  void changeActiveCheckbox() {
    isActiveChecked = !isActiveChecked;
    changeActiveButton();
  }
}
