import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/services/auth/iauth_service.dart';

/// Authentication service.
class AuthService implements IAuthService {
  @override
  Future<String> login(LoginArgs args) async {
    final response = await http.post(
      Uri.parse('${Env.HOST}/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': args.email,
        'password': args.password,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<String> register(RegisterArgs args) async {
    final response = await http.post(
      Uri.parse('${Env.HOST}/auth/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': args.email,
        'name': args.name,
        'surname': args.surname,
        'gsmNumber': args.gsmNumber,
        'password': args.password,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register');
    }
  }
}
