// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:payment_exercise/models/user_address.dart';

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
    this.addressList,
    this.identityNumber,
  });
  final String name;
  final String surname;
  final String gsmNumber;
  final String email;
  final String? identityNumber;
  final List<UserAddress>? addressList;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
