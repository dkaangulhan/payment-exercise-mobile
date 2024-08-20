import 'package:flutter/material.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/models/user_session.dart';
import 'package:payment_exercise/repos/auth_repo.dart';
import 'package:payment_exercise/repos/profile_repo.dart';
import 'package:payment_exercise/repos/session_repo.dart';
import 'package:payment_exercise/services/auth/iauth_service.dart';

/// Use case for register
class RegisterUseCase {
  /// Use case for register
  RegisterUseCase(
    this.authRepo,
    this.sessionRepo,
    this.profileRepo,
    this.sessionStore,
  );

  /// Auth repository
  final AuthRepo authRepo;

  /// Session repository
  final SessionRepo sessionRepo;

  /// Profile repository
  final ProfileRepo profileRepo;

  /// Session store
  final SessionStore sessionStore;

  /// Registers the user.
  Future<void> execute(
    String email,
    String name,
    String surname,
    String gsmNumber,
    String password,
  ) async {
    try {
      final token = await authRepo.register(
        RegisterArgs(
          email: email,
          name: name,
          surname: surname,
          gsmNumber: gsmNumber,
          password: password,
        ),
      );

      final user = await profileRepo.getUser(token);

      final userSession = UserSession.user(
        token: token,
        user: user,
      );

      await updateSession(userSession);
    } catch (e, st) {
      print('Error: $e, StackTrace: $st');
      rethrow;
    }
  }

  @visibleForTesting

  /// Updates the session.
  Future<void> updateSession(UserSession userSession) async {
    await sessionRepo.saveSession(userSession);
    sessionStore.userSession = userSession;
  }
}
