// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      surname: json['surname'] as String,
      gsmNumber: json['gsmNumber'] as String,
      email: json['email'] as String,
      addressList: (json['addressList'] as List<dynamic>?)
          ?.map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      identityNumber: json['identityNumber'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'gsmNumber': instance.gsmNumber,
      'email': instance.email,
      'identityNumber': instance.identityNumber,
      'addressList': instance.addressList,
    };
