// ignore_for_file: public_member_api_docs

/// Interface for AuthService
abstract class IAuthService {
  /// Login method
  Future<String> login(LoginArgs args);

  /// Register method
  Future<String> register(RegisterArgs args);
}

class LoginArgs {
  LoginArgs({required this.email, required this.password});
  final String email;
  final String password;
}

class RegisterArgs {
  RegisterArgs({
    required this.name,
    required this.surname,
    required this.gsmNumber,
    required this.email,
    required this.password,
  });

  final String name;
  final String surname;
  final String gsmNumber;
  final String email;
  final String password;
}
