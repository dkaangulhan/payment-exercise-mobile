import 'package:payment_exercise/services/auth/iauth_service.dart';

/// Repository for authentication operations.
class AuthRepo {
  /// Repository for authentication operations.
  AuthRepo(this.iAuthService);

  /// Service for authentication operations.
  IAuthService iAuthService;

  /// Login method
  Future<String> login(LoginArgs loginArgs) async {
    return iAuthService.login(loginArgs);
  }

  /// Register method
  Future<String> register(RegisterArgs registerArgs) async {
    return iAuthService.register(registerArgs);
  }
}
