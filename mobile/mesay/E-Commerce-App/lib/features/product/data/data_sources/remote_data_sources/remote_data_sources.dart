import '../../../domain/entities/product_entity.dart';
import '../../models/product_model.dart';

abstract class RemoteDataSource {
  Future<ProductModel> getProduct(String productId);
  Future<void> createProduct(ProductEntity product);
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteProduct(String productId);
}
