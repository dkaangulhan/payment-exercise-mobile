import 'dart:convert';

import 'package:payment_exercise/models/user_session.dart';
import 'package:payment_exercise/services/session/isession_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Session service for session related operations.
class SessionService implements ISessionService {
  @override
  Future<void> destroySession() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove('session');
  }

  @override
  Future<UserSession> loadSession() async {
    final sp = await SharedPreferences.getInstance();
    final session = sp.getString('session');
    if (session == null) {
      return UserSession(isLoggedIn: false);
    }
    return UserSession.fromJson(jsonDecode(session) as Map<String, dynamic>);
  }

  @override
  Future<void> saveSession(UserSession userSession) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(
      'session',
      jsonEncode(userSession.toJson()),
    );
  }
}
