import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/cart_store.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/use_cases/cart/get_cart_use_case.dart';

/// Shopping cart page.
class ShoppingCartPage extends StatefulWidget {
  /// Shopping cart page.
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  void initState() {
    super.initState();
    GetCartUseCase(
      cartRepo: getit.get(),
      cartStore: getit.get(),
    ).execute(
      getit.get<SessionStore>().userSession.token!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: getit.get<CartStore>(),
      builder: (context, _) {
        final cartItems = getit.get<CartStore>().cartItems;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Shopping Cart'),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await GetCartUseCase(
                cartRepo: getit.get(),
                cartStore: getit.get(),
              ).execute(
                getit.get<SessionStore>().userSession.token!,
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return ListTile(
                        title: Text(cartItem.product.name),
                        subtitle: Text('Quantity: ${cartItem.quantity}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            getit.get<CartStore>().removeCartItem(cartItem);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/checkout');
                    },
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
