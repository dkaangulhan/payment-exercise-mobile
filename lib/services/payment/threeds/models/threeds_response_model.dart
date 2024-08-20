// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'threeds_response_model.g.dart';

/// ThreedsResponseModel class is used to define the model for the 3DS response.

@JsonSerializable()
class ThreedsResponseModel {
  /// ThreedsResponseModel class is used to define the model
  /// for the 3DS response.
  ThreedsResponseModel({
    required this.status,
    required this.locale,
    required this.systemTime,
    required this.conversationId,
    required this.threeDSHtmlContent,
    this.errorMessage,
  });

  final String status;
  final String locale;
  final int systemTime;
  final String conversationId;
  final String? threeDSHtmlContent;
  final String? errorMessage;

  /// Converts a [Map] to an [ThreedsResponseModel]
  factory ThreedsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ThreedsResponseModelFromJson(json);

  /// Converts a [ThreedsResponseModel] to a [Map]
  Map<String, dynamic> toJson() => _$ThreedsResponseModelToJson(this);

  @override
  String toString() {
    return 'ThreedsResponseModel(status: $status, locale: $locale, systemTime: $systemTime, conversationId: $conversationId, threeDSHtmlContent: $threeDSHtmlContent, errorMessage: $errorMessage)';
  }
}
