import 'package:json_annotation/json_annotation.dart';
import 'package:payment_exercise/models/user_address.dart';

part 'update_profile_params.g.dart';

@JsonSerializable()

/// Parameters for updating the profile.
class UpdateProfileParams {
  /// Parameters for updating the profile.
  UpdateProfileParams({
    this.name,
    this.surname,
    this.identityNumber,
    this.addressList,
  });
  // ignore: public_member_api_docs
  final String? name;
  // ignore: public_member_api_docs
  final String? surname;
  // ignore: public_member_api_docs
  final String? identityNumber;
  // ignore: public_member_api_docs
  final List<UserAddress>? addressList;

  // ignore: sort_constructors_first, public_member_api_docs
  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamsFromJson(json);

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() => _$UpdateProfileParamsToJson(this);
}
