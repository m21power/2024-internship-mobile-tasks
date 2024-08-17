import '../../../domain/entities/product_entity.dart';
import '../../models/product_model.dart';

abstract class LocalDataSources {
  /// returns cache exception if the is not data in the cache
  Future<ProductModel> getProduct(String productId);
  Future<void> createCacheProduct(ProductEntity product);
  Future<void> deleteProduct({required String productId});
  Future<void> updateProduct(ProductEntity product);
}
