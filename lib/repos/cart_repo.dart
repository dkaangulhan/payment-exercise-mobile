import 'package:payment_exercise/models/cart_item.dart';
import 'package:payment_exercise/services/cart/icart_service.dart';

/// Cart repository
class CartRepo {
  /// Constructor
  CartRepo(this.iCartService);

  /// Cart service
  final ICartService iCartService;

  /// Get user cart
  Future<List<CartItem>> getCart(String token) async {
    return iCartService.getCart(token);
  }

  /// Add product to cart
  Future<void> addToCart(
    String token,
    String productId,
  ) async {
    return iCartService.addToCart(token, productId);
  }
}
