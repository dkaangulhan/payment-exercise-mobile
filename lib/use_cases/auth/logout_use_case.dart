import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/models/user_session.dart';
import 'package:payment_exercise/repos/session_repo.dart';

/// Use case for logout
class LogoutUseCase {
  /// Use case for logout
  LogoutUseCase(
    this.sessionRepo,
    this.sessionStore,
  );

  /// Session repository
  final SessionRepo sessionRepo;

  /// Session store
  final SessionStore sessionStore;

  /// Logs out the user.
  Future<void> execute() async {
    try {
      await sessionRepo.destroySession();
      final freshSession = UserSession.guest();
      await sessionRepo.saveSession(freshSession);
      sessionStore.userSession = freshSession;
    } catch (e, st) {
      print('Error: $e, StackTrace: $st');
      rethrow;
    }
  }
}
