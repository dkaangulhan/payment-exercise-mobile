import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/services/payment/threeds/ithreeds_service.dart';
import 'package:payment_exercise/services/payment/threeds/models/threeds_response_model.dart';

/// Threeds service.
class ThreedsService implements IThreedsService {
  @override
  Future<ThreedsResponseModel> initialize(
    PaymentInitParams params,
    String token,
  ) async {
    final response = await http.post(
      Uri.parse('${Env.HOST}/payment/threeds/initialize'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          'paymentCard': params.toJson(),
        },
      ),
    );

    if (response.statusCode == 200) {
      return ThreedsResponseModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception(
        '''Failed to initialize 3DS, status code: ${response.statusCode}, body: ${response.body}''',
      );
    }
  }
}
