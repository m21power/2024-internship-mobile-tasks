import 'package:fpdart/fpdart.dart';

import '../../../../core/failures/Failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> createProduct(ProductEntity product);
  Future<void> deleteProduct({required String productId});
  Future<void> updateProduct(ProductEntity product);
  Future<Either<Failure, ProductEntity>> getProduct(
      {required String productId});
}
