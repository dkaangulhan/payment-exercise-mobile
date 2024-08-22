// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'package:payment_exercise/models/user_model.dart';

part 'user_session.g.dart';

@JsonSerializable()

/// This is session model when user logged in.
/// If user is not logged in, [isLoggedIn] will be false
/// and [token] will be null.
class UserSession {
  /// Default constructor for [UserSession].
  UserSession({
    required this.isLoggedIn,
    this.token,
    this.user,
  });

  /// guest user constructor for [UserSession].
  UserSession.guest()
      : isLoggedIn = false,
        token = null,
        user = null;

  /// logged in user constructor for [UserSession].
  UserSession.user({
    required this.token,
    required this.user,
  }) : isLoggedIn = true;

  UserSession copyWith({
    bool? isLoggedIn,
    String? token,
    UserModel? user,
  }) {
    return UserSession(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  final bool isLoggedIn;
  final String? token;
  final UserModel? user;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
