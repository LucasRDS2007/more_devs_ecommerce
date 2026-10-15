import 'package:more_devs_ecommerce/shared/network/http_client.dart';
import 'package:more_devs_ecommerce/shared/network/http_client_exception.dart';

class SignupService {
  SignupService({HttpClient? httpClient})
    : _httpClient = httpClient ?? HttpClient();

  final HttpClient _httpClient;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptedTerms,
  }) async {
    try {
      await _httpClient.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'acceptedTerms': acceptedTerms,
        },
      );
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final code = body['code']?.toString();
        final message = body['message']?.toString();
        final details = body['details'];

        if (code == 'EMAIL_ALREADY_EXISTS') {
          throw Exception(message ?? 'Este email ja esta cadastrado.');
        }

        if (code == 'VALIDATION_ERROR' && details is List) {
          final messages = details
              .whereType<Map>()
              .map((detail) => detail['message']?.toString())
              .whereType<String>()
              .where((detailMessage) => detailMessage.isNotEmpty)
              .toSet();
          if (messages.isNotEmpty) {
            throw Exception(messages.join('\n'));
          }
        }

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception(
          'Nao foi possivel criar a conta. Confira os dados e tente novamente.',
        );
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }
}
