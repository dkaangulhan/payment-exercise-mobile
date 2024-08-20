// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

/// This is the model class for purchasable products.
@immutable
@JsonSerializable()
final class ProductModel {
  /// This is the model class for purchasable products.
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
  });
  final String id;
  final String name;
  final double price;
  final String? description;
  final String? imageUrl;

  /// Converts a map to an instance of this class.
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Converts an instance of this class to a map.
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
