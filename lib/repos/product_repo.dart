import 'package:payment_exercise/models/product_model.dart';
import 'package:payment_exercise/services/product/iproduct_service.dart';

/// Repository for products
class ProductRepo {
  /// Constructor
  ProductRepo(this.iProductService);

  /// Service
  final IProductService iProductService;

  /// Fetches the products from the server
  Future<List<ProductModel>> fetchProducts() async {
    return iProductService.fetchProducts();
  }
}
