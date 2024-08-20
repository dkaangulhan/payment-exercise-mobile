import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/services/profile/iprofile_service.dart';

/// Service for profile operations.
class ProfileService implements IProfileService {
  @override
  Future<UserModel> getUser(String token) async {
    final response = await http.get(
      Uri.parse('${Env.HOST}/profile/getProfile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to get user profile');
    }
  }
}
