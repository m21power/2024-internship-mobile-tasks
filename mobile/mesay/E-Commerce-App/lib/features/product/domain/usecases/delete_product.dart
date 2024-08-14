import '../repository/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Future<void> call(String productId) async {
    return repository.deleteProduct(productId: productId);
  }
}
