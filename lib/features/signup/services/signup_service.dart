import 'package:dio/dio.dart';
import 'package:more_devs_ecommerce/features/login/models/auth_user.dart';
import 'package:more_devs_ecommerce/features/signup/exceptions/signup_exception.dart';

class SignupService {
  final String baseUrl = 'https://api-production-c0289.up.railway.app/api/v1/';

  final Dio dio = Dio();

  Future<AuthUser> registerUser(
    String name,
    String email,
    String password,
    String confirmPassword,
    bool acceptedTerms,
  ) async {
    try {
      final response = await dio.post(
        '${baseUrl}auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'acceptedTerms': acceptedTerms,
        },
      );

      return AuthUser.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
      // final statusCode = e.response?.statusCode;

      // switch (statusCode) {
      //   case 400:
      //     throw SignupException(SignupExceptionType.invalidData);

      //   case 409:
      //     throw SignupException(SignupExceptionType.emailAlreadyExists);

      //   default:
      //     if (e.response == null) {
      //       throw SignupException(SignupExceptionType.connectionError);
      //     }

      //     throw SignupException(SignupExceptionType.serverError);
      // }
    }
  }
}
