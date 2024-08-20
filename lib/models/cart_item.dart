import 'package:json_annotation/json_annotation.dart';
import 'package:payment_exercise/models/product_model.dart';

part 'cart_item.g.dart';

/// CartItem model class
@JsonSerializable()
class CartItem {
  /// CartItem model class
  CartItem({
    required this.product,
    required this.quantity,
  });
  // ignore: public_member_api_docs
  final ProductModel product;
  // ignore: public_member_api_docs
  final int quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
