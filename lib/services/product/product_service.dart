import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/models/product_model.dart';
import 'package:payment_exercise/services/product/iproduct_service.dart';

/// Implementation of the product service
class ProductService implements IProductService {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('${Env.HOST}/product/getAll'),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      return body.map(
        (dynamic item) {
          final itemWithId = item as Map<String, dynamic>;
          itemWithId['id'] = itemWithId['_id'];

          return ProductModel.fromJson(itemWithId);
        },
      ).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
