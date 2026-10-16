import 'package:more_devs_ecommerce/features/login/models/auth_user.dart';
import 'package:more_devs_ecommerce/shared/network/http_client.dart';
import 'package:more_devs_ecommerce/shared/network/http_client_exception.dart';

class LoginService {
  final HttpClient httpClient = HttpClient();

  Future<AuthUser> loginUser(String email, String password) async {
    try {
      final response = await httpClient.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      return AuthUser.fromJson(response);
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('Nao foi possivel efetuar o login');
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }
}
