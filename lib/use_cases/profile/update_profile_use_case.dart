import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/repos/profile_repo.dart';
import 'package:payment_exercise/use_cases/profile/models/update_profile_params.dart';

/// This class is responsible for updating the profile.
class UpdateProfileUseCase {
  /// Constructor.
  UpdateProfileUseCase(
    this.profileRepo,
    this.sessionStore,
  );

  // ignore: public_member_api_docs
  final ProfileRepo profileRepo;
  // ignore: public_member_api_docs
  final SessionStore sessionStore;

  /// Updates the profile.
  Future<void> execute({
    required UpdateProfileParams params,
    required String token,
  }) async {
    await profileRepo.updateUser(
      token,
      params,
    );
    final updatedUser = await profileRepo.getUser(token);
    sessionStore.userSession = sessionStore.userSession.copyWith(
      user: updatedUser,
    );
  }
}
