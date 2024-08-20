import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/models/cart_item.dart';
import 'package:payment_exercise/services/cart/icart_service.dart';

/// Cart service
class CartService implements ICartService {
  @override
  Future<List<CartItem>> getCart(String token) async {
    final response = await http.get(
      Uri.parse('${Env.HOST}/cart/get'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final cartItemsJson = jsonDecode(response.body) as List<dynamic>;
      return cartItemsJson
          .map(
            (dynamic cartItemJson) => CartItem.fromJson(
              cartItemJson as Map<String, dynamic>,
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to get cart');
    }
  }

  @override
  Future<void> addToCart(String token, String productId) async {
    final response = await http.post(
      Uri.parse('${Env.HOST}/cart/add'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'productId': productId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add product to cart');
    }
  }
}
