import 'package:payment_exercise/models/user_session.dart';

/// Interface for session related services.
abstract class ISessionService {
  /// This destroys the current session.
  Future<void> destroySession();

  /// This saves the current session.
  Future<void> saveSession(UserSession userSession);

  /// This loads the current session.
  Future<UserSession> loadSession();
}
