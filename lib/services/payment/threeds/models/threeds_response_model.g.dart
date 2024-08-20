// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threeds_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreedsResponseModel _$ThreedsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ThreedsResponseModel(
      status: json['status'] as String,
      locale: json['locale'] as String,
      systemTime: (json['systemTime'] as num).toInt(),
      conversationId: json['conversationId'] as String,
      threeDSHtmlContent: json['threeDSHtmlContent'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ThreedsResponseModelToJson(
        ThreedsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'locale': instance.locale,
      'systemTime': instance.systemTime,
      'conversationId': instance.conversationId,
      'threeDSHtmlContent': instance.threeDSHtmlContent,
      'errorMessage': instance.errorMessage,
    };
