import 'package:fpdart/fpdart.dart';

import '../../../../core/failures/Failure.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, ProductEntity>> call(String id) async {
    return await repository.getProduct(productId: id);
  }
}
