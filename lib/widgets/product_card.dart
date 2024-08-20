import 'package:flutter/material.dart';
import 'package:payment_exercise/models/product_model.dart';

/// This is the widget for displaying a product.
class ProductCard extends StatelessWidget {
  /// This is the widget for displaying a product.
  const ProductCard({
    required this.product,
    this.onPressed,
    super.key,
  });

  /// Product to display.
  final ProductModel product;

  /// Callback for when the product is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            if (product.imageUrl != null)
              Image.network(
                product.imageUrl!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${product.price} TL',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
