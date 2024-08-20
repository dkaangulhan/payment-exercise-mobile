import 'package:flutter/material.dart';
import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/models/user_session.dart';

/// Global session related store for the application.
class SessionStore extends ChangeNotifier {
  var _userSession = UserSession.guest();

  /// User's session.
  UserSession get userSession => _userSession;
  set userSession(UserSession userSession) {
    _userSession = userSession;
    notifyListeners();
  }

  /// Checks if the user is logged in.
  bool get isLoggedIn => _userSession.isLoggedIn;

  /// User's model. If the user is not logged in, this will be null.
  UserModel? get user => _userSession.user;
}
