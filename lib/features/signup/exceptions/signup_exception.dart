enum SignupExceptionType {
  emailAlreadyExists,
  invalidData,
  connectionError,
  serverError,
}

class SignupException implements Exception {
  final SignupExceptionType type;

  SignupException(this.type);
}
