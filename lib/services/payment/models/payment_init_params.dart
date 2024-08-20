import 'package:json_annotation/json_annotation.dart';

part 'payment_init_params.g.dart';

/// Parameters for initializing payment
@JsonSerializable()
class PaymentInitParams {
  /// Parameters for initializing payment
  PaymentInitParams({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expireMonth,
    required this.expireYear,
    required this.cvc,
    required this.registerCard,
  });

  // ignore: public_member_api_docs
  final String cardHolderName;
  // ignore: public_member_api_docs
  final String cardNumber;
  // ignore: public_member_api_docs
  final String expireMonth;
  // ignore: public_member_api_docs
  final String expireYear;
  // ignore: public_member_api_docs
  final String cvc;
  // ignore: public_member_api_docs
  final String registerCard;

  /// Converts a [Map] to an [PaymentInitParams]
  // ignore: sort_constructors_first
  factory PaymentInitParams.fromJson(Map<String, dynamic> json) =>
      _$PaymentInitParamsFromJson(json);

  /// Converts a [PaymentInitParams] to a [Map]
  Map<String, dynamic> toJson() => _$PaymentInitParamsToJson(this);
}
