import 'package:payment_exercise/models/product_model.dart';

/// Interface for product related services
abstract class IProductService {
  /// Fetches the products from the server
  Future<List<ProductModel>> fetchProducts();
}
