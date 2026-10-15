import 'package:dio/dio.dart';
import 'package:more_devs_ecommerce/features/login/models/auth_user.dart';
import 'package:more_devs_ecommerce/features/signup/exceptions/signup_exception.dart';
import 'package:more_devs_ecommerce/shared/http/http_client.dart';
import 'package:more_devs_ecommerce/shared/http/http_exception.dart';

class SignupService {
  final HttpClient httpClient = HttpClient();

  Future<AuthUser> registerUser(
    String name,
    String email,
    String password,
    String confirmPassword,
    bool acceptedTerms,
  ) async {
    try {
      final response = await httpClient.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'acceptedTerms': acceptedTerms,
        },
      );

      return AuthUser.fromJson(response.data);
    } on HttpException catch (e) {
      switch (e.statusCode) {
        case 400:
          throw SignupException(SignupExceptionType.invalidData);

        case 409:
          throw SignupException(SignupExceptionType.emailAlreadyExists);

        default:
          if (e.statusCode == null) {
            throw SignupException(SignupExceptionType.connectionError);
          }

          throw SignupException(SignupExceptionType.serverError);
      }
    }
  }
}
