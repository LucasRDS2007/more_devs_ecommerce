import 'package:more_devs_ecommerce/features/home/models/category_models.dart';
import 'package:more_devs_ecommerce/features/home/models/product_models.dart';
import 'package:more_devs_ecommerce/shared/network/http_client.dart';
import 'package:more_devs_ecommerce/shared/network/http_client_exception.dart';

class HomeService {
  HttpClient httpClient = HttpClient();

  Future<List<Category>> getCategory() async {
    try {
      final response = await httpClient.get('/categories');
      return (response['data'] as List)
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList();
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('Não foi possivel carregar as categorias');
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }

  Future<List<Product>> getProduct() async {
    try {
      final response = await httpClient.get('/products');

      return (response['data'] as List)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('Não foi possivel carregar os produtos');
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }
}
