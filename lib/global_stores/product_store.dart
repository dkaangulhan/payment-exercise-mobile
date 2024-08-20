import 'package:flutter/material.dart';
import 'package:payment_exercise/models/product_model.dart';

/// Store for products
class ProductStore extends ChangeNotifier {
  /// Constructor
  ProductStore();

  /// List of products
  List<ProductModel> products = [];

  /// Adds a product to the list
  void addProduct(ProductModel product) {
    products.add(product);
    notifyListeners();
  }

  /// This method adds all products to the list
  void addAllProducts(List<ProductModel> products) {
    this.products = products;
    notifyListeners();
  }

  /// Removes a product from the list
  void removeProduct(ProductModel product) {
    products.remove(product);
    notifyListeners();
  }
}
