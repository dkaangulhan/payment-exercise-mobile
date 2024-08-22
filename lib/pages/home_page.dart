import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/product_store.dart';
import 'package:payment_exercise/use_cases/product/get_all_products_use_case.dart';
import 'package:payment_exercise/widgets/product_card.dart';

/// Home page of the application.
class HomePage extends StatelessWidget {
  /// Home page of the application.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iyzico Payment Exercise'),
        actions: [
          IconButton(
            /// Shopping cart icon
            icon: const Icon(Icons.shopping_cart),
            onPressed: () async {
              context.go('/profile/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await GetAllProductsUseCase(
                  getit(),
                  getit(),
                ).execute();
              },
              child: const _ProductList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: getit<ProductStore>(),
      builder: (context, _) {
        final store = getit<ProductStore>();
        final products = store.products;

        if (store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
              onPressed: () {
                context.push(
                  '/product',
                  extra: products[index],
                );
              },
            );
          },
          itemCount: products.length,
        );
      },
    );
  }
}
