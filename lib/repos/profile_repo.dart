import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/services/profile/iprofile_service.dart';

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
}
