import '../../models/product_model.dart';

abstract class LocalDataSources {
  /// returns cache exception if the is not data in the cache
  Future<ProductModel> getProduct(String productId);

  Future<void> createCacheProduct(ProductModel product);
}
