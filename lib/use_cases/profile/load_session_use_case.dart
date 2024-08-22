import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/repos/session_repo.dart';

/// Load session use case.
class LoadSessionUseCase {
  /// Load session use case.
  LoadSessionUseCase(this.sessionRepository, this.sessionStore);

  // ignore: public_member_api_docs
  final SessionRepo sessionRepository;
  // ignore: public_member_api_docs
  final SessionStore sessionStore;

  /// Load session.
  Future<void> execute() async {
    final userSession = await sessionRepository.loadSession();
    sessionStore.userSession = userSession;
  }
}
