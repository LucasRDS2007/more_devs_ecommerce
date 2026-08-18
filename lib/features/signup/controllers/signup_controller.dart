class SignupController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _nameRegex = RegExp(
    r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
  );
  final RegExp _senhaMaiuscula = RegExp(r'[A-Z]');
  final RegExp _senhaMinuscula = RegExp(r'[a-z]');
  final RegExp _senhaCaracterEspecial = RegExp(r'[^a-zA-Z0-9]');
  final int _caracterMinimoSenha = 6;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveChecked = false;
  bool isActiveButton = false;
  bool isLoading = false;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isNomeValid => _nameRegex.hasMatch(nome.trim());
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
    changeActiveButton();
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

  Future<void> signup() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
