import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payment_exercise/env/env.dart';
import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/services/profile/iprofile_service.dart';
import 'package:payment_exercise/use_cases/profile/models/update_profile_params.dart';

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

  @override
  Future<UserModel> updateUser(String token, UpdateProfileParams params) async {
    final response = await http.put(
      Uri.parse('${Env.HOST}/profile/update'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        params.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to update user profile');
    }
  }
}
