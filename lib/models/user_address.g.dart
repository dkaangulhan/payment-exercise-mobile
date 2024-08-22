// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      contactName: json['contactName'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      address: json['address'] as String,
      zipCode: json['zipCode'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'contactName': instance.contactName,
      'city': instance.city,
      'country': instance.country,
      'address': instance.address,
      'zipCode': instance.zipCode,
      'phone': instance.phone,
    };
