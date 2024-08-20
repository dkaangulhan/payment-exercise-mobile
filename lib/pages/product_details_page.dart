import 'package:flutter/material.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/models/product_model.dart';
import 'package:payment_exercise/use_cases/cart/add_to_cart_use_case.dart';

/// This is the page for displaying the details of a product.
class ProductDetailsPage extends StatefulWidget {
  /// This is the page for displaying the details of a product.
  const ProductDetailsPage({
    required this.product,
    super.key,
  });

  /// Product to display.
  final ProductModel? product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductModel? get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Builder(
        builder: (context) {
          if (this.product == null) {
            return const Center(
              child: Text('Product not found.'),
            );
          }

          final product = this.product!;

          return ListView(
            padding: const EdgeInsets.all(8),
            children: [
              if (product.imageUrl != null)
                Image.network(
                  product.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (product.description != null)
                Text(
                  product.description!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              Text(
                '${product.price} TL',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              // Add a button to buy the product.
              ElevatedButton(
                onPressed: () {
                  AddToCartUseCase(
                    cartRepo: getit.get(),
                    cartStore: getit.get(),
                  ).execute(
                    getit.get<SessionStore>().userSession.token!,
                    product.id,
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ],
          );
        },
      ),
    );
  }
}
