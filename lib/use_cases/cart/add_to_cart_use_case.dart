import 'package:payment_exercise/global_stores/cart_store.dart';
import 'package:payment_exercise/repos/cart_repo.dart';
import 'package:payment_exercise/use_cases/cart/get_cart_use_case.dart';

/// Use case for adding a product to the cart.
class AddToCartUseCase {
  // ignore: public_member_api_docs
  AddToCartUseCase({
    required this.cartRepo,
    required this.cartStore,
  });

  /// Cart repository
  final CartRepo cartRepo;

  // ignore: public_member_api_docs
  final CartStore cartStore;

  // ignore: public_member_api_docs
  Future<void> execute(String token, String productId) async {
    await cartRepo.addToCart(token, productId);
    await GetCartUseCase(
      cartRepo: cartRepo,
      cartStore: cartStore,
    ).execute(token);
  }
}
