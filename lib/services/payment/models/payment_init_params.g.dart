// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_init_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInitParams _$PaymentInitParamsFromJson(Map<String, dynamic> json) =>
    PaymentInitParams(
      cardHolderName: json['cardHolderName'] as String,
      cardNumber: json['cardNumber'] as String,
      expireMonth: json['expireMonth'] as String,
      expireYear: json['expireYear'] as String,
      cvc: json['cvc'] as String,
      registerCard: json['registerCard'] as String,
    );

Map<String, dynamic> _$PaymentInitParamsToJson(PaymentInitParams instance) =>
    <String, dynamic>{
      'cardHolderName': instance.cardHolderName,
      'cardNumber': instance.cardNumber,
      'expireMonth': instance.expireMonth,
      'expireYear': instance.expireYear,
      'cvc': instance.cvc,
      'registerCard': instance.registerCard,
    };
