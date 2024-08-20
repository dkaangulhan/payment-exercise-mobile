import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/services/payment/models/payment_init_params.dart';
import 'package:payment_exercise/services/payment/non_threeds/inon_threeds_service.dart';

/// Non 3DS service
class NonThreedsService implements INonThreedsService {
  @override
  Future<void> pay(PaymentInitParams params, String token) async {
    final response = await http.post(
      Uri.parse('${Env.HOST}/payment/nonThreeds/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'paymentCard': params.toJson(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to pay');
    }
  }
}
