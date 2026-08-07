class SignupController {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveChecked = false;
  bool isActiveButton = false;

  void setEmail(String emailParam) {
    email = emailParam;
  }

  void setNome(String nomeParam) {
    nome = nomeParam;
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
  }

  void setConfirmarSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
  }

  void changeActiveButton() {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveChecked;
  }

  void changeActiveCheckbox() {
    isActiveChecked = !isActiveChecked;
  }
}
