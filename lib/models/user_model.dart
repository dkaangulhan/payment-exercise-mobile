// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

/// User model for user information.
// ignore_for_file: public_member_api_docs

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  /// User model for user information.
  UserModel({
    required this.name,
    required this.surname,
    required this.gsmNumber,
    required this.email,
  });
  final String name;
  final String surname;
  final String gsmNumber;
  final String email;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
