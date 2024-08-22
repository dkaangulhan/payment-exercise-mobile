// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileParams _$UpdateProfileParamsFromJson(Map<String, dynamic> json) =>
    UpdateProfileParams(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      identityNumber: json['identityNumber'] as String?,
      addressList: (json['addressList'] as List<dynamic>?)
          ?.map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateProfileParamsToJson(
        UpdateProfileParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'identityNumber': instance.identityNumber,
      'addressList': instance.addressList,
    };
