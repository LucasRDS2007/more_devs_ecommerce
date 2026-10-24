import 'package:more_devs_ecommerce/features/cart/models/product_cart.dart';
import 'package:more_devs_ecommerce/shared/network/http_client.dart';
import 'package:more_devs_ecommerce/shared/network/http_client_exception.dart';

class CartService {
  HttpClient httpClient = HttpClient();

  Future<Cart> getCart(String? token) async {
    try {
      final response = await httpClient.get('/cart', token: token);
      return Cart.fromJson(response);
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('Não foi possivel carregar o carrinho.');
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }

  Future<Cart> addItem({
    required String productId,
    required int quantity,
    required String token,
  }) async {
    try {
      final response = await httpClient.post(
        '/cart/items',
        token: token,
        data: {'productId': productId, 'quantity': quantity},
      );
      return Cart.fromJson(response);
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('Não foi possível adicionar o produto ao carrinho.');
      }
      throw Exception(
        'Não foi possível conectar ao servidor. Tente novamente.',
      );
    }
  }

  Future<Cart> updateItem({
    required String productId,
    required int quantity,
    required String token,
  }) async {
    try {
      final response = await httpClient.patch(
        '/cart/items/$productId',
        token: token,
        data: {'quantity': quantity},
      );
      return Cart.fromJson(response);
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('Nao foi possivel atualizar o produto no carrinho.');
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }

  Future<Cart> removeItem({
    required String productId,
    required String token,
  }) async {
    try {
      final response = await httpClient.delete(
        '/cart/items/$productId',
        token: token,
      );
      return Cart.fromJson(response);
    } on HttpClientException catch (error) {
      final body = error.responseData;
      if (body is Map) {
        final message = body['message']?.toString();

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (error.statusCode != null) {
        throw Exception('NÃ£o foi possÃ­vel remover o produto do carrinho.');
      }
      throw Exception(
        'NÃ£o foi possÃ­vel conectar ao servidor. Tente novamente.',
      );
    }
  }
}
