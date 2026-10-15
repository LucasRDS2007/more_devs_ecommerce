import 'package:more_devs_ecommerce/features/login/models/auth_user.dart';
import 'package:more_devs_ecommerce/shared/http/http_client.dart';
import 'package:more_devs_ecommerce/shared/http/http_exception.dart';

class LoginService {
  final HttpClient httpClient = HttpClient();

  Future<AuthUser> loginUser(String email, String password) async {
    try {
      final response = await httpClient.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      return AuthUser.fromJson(response.data);
    } on HttpException catch (e) {
      switch (e.statusCode) {
        case 401:
          throw LoginException(LoginExceptionType.unauthorized);

        case 422:
          throw LoginException(LoginExceptionType.invalidData);

        default:
          rethrow;
      }
    }
  }
}
