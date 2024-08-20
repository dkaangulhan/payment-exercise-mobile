import 'package:payment_exercise/global_stores/cart_store.dart';
import 'package:payment_exercise/repos/cart_repo.dart';

/// Use case for getting the cart of the user
class GetCartUseCase {
  // ignore: public_member_api_docs
  GetCartUseCase({
    required this.cartRepo,
    required this.cartStore,
  });

  /// Cart repository
  final CartRepo cartRepo;

  // ignore: public_member_api_docs
  final CartStore cartStore;

  // ignore: public_member_api_docs
  Future<void> execute(String token) async {
    final cart = await cartRepo.getCart(token);
    cartStore.addAllCartItems(cart);
  }
}
