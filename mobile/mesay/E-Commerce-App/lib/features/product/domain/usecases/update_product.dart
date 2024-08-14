import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<void> call(ProductEntity product) async {
    return repository.updateProduct(product);
  }
}
