import 'package:payment_exercise/global_stores/product_store.dart';
import 'package:payment_exercise/repos/product_repo.dart';

/// Use case for getting all products
class GetAllProductsUseCase {
  /// Constructor
  GetAllProductsUseCase(this.productRepo, this.productStore);

  /// Product repository
  final ProductRepo productRepo;

  /// Global product store
  final ProductStore productStore;

  /// Fetches all products
  Future<void> execute() async {
    final products = await productRepo.fetchProducts();
    productStore.addAllProducts(products);
  }
}
