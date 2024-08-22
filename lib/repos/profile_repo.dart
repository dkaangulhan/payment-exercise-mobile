import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/services/profile/iprofile_service.dart';
import 'package:payment_exercise/use_cases/profile/models/update_profile_params.dart';

/// Repo for profile related operations.
class ProfileRepo {
  /// Repo for profile related operations.
  ProfileRepo(this.iProfileService);

  /// Service for profile related operations.
  IProfileService iProfileService;

  /// Get user profile.
  Future<UserModel> getUser(String token) async {
    return iProfileService.getUser(token);
  }

  /// Update user profile.
  Future<UserModel> updateUser(String token, UpdateProfileParams params) async {
    return iProfileService.updateUser(token, params);
  }
}
