import 'package:json_annotation/json_annotation.dart';

part 'user_address.g.dart';

/// User Address Model
@JsonSerializable()
class UserAddress {
  /// User Address Model
  UserAddress({
    required this.contactName,
    required this.city,
    required this.country,
    required this.address,
    required this.zipCode,
    this.phone,
  });

  // ignore: public_member_api_docs
  final String contactName;
  // ignore: public_member_api_docs
  final String city;
  // ignore: public_member_api_docs
  final String country;
  // ignore: public_member_api_docs
  final String address;
  // ignore: public_member_api_docs
  final String zipCode;
  // ignore: public_member_api_docs
  final String? phone;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

  @override
  String toString() {
    return '''UserAddress(contactName: $contactName, city: $city, country: $country, address: $address, zipCode: $zipCode, phone: $phone)''';
  }
}
