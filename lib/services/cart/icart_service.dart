import 'package:payment_exercise/models/cart_item.dart';

/// Interface for service for cart operations.
abstract class ICartService {
  /// Get user cart
  Future<List<CartItem>> getCart(String token);

  /// Add product to cart
  Future<void> addToCart(
    String token,
    String productId,
  );
}
