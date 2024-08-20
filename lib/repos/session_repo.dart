import 'package:payment_exercise/models/user_session.dart';
import 'package:payment_exercise/services/session/isession_service.dart';

/// Session repository for session related operations.
class SessionRepo {
  /// Session repository for session related operations.
  SessionRepo(this.isessionService);

  /// Session service for session related operations.
  final ISessionService isessionService;

  /// This destroys the current session.
  Future<void> destroySession() async {
    await isessionService.destroySession();
  }

  /// This saves the current session.
  Future<void> saveSession(UserSession userSession) async {
    await isessionService.saveSession(userSession);
  }

  /// This loads the current session.
  Future<UserSession> loadSession() async {
    return isessionService.loadSession();
  }
}
