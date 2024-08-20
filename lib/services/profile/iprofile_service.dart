import 'package:payment_exercise/models/user_model.dart';

/// Interface for service for profile operations.
abstract class IProfileService {
  /// Get user profile.
  Future<UserModel> getUser(String token);
}
