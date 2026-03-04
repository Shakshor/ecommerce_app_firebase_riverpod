import 'package:ecommerce_app_firebase_riverpod/src/constants/test_products.dart';
import 'package:ecommerce_app_firebase_riverpod/src/features/products/domain/product.dart';

class FakeProductsRepository {
  FakeProductsRepository._(); // private construcel
  static FakeProductsRepository instance = FakeProductsRepository._();

  List<Product> getProductsList() {
    return kTestProducts;
  }

  Product? getProduct(String id) {
    return kTestProducts.firstWhere((product) => product.id == id);
  }
}
