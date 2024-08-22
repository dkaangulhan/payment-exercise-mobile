import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/use_cases/profile/models/update_profile_params.dart';

/// Interface for service for profile operations.
abstract class IProfileService {
  /// Get user profile.
  Future<UserModel> getUser(String token);

  /// Update user profile.
  Future<UserModel> updateUser(String token, UpdateProfileParams params);
}
