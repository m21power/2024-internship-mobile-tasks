import 'package:fpdart/src/either.dart';
import '../../../../core/failures/Failure.dart';
import '../../../platform/network_info.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_sources/local_data_sources/local_data_sources.dart';
import '../data_sources/remote_data_sources/remote_data_sources.dart';

class ProductRepositoryImp implements ProductRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSources localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> createProduct(ProductEntity product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.createProduct(product);
        await localDataSource.createCacheProduct(product);
      } catch (e) {
        throw ServerFailure();
      }
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<void> deleteProduct({required String productId}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(productId);
        await localDataSource.deleteProduct(productId: productId);
      } catch (e) {
        throw ServerFailure();
      }
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProduct(product);
        await localDataSource.createCacheProduct(product);
      } catch (e) {
        throw ServerFailure();
      }
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(
      {required String productId}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProduct(productId);
        await localDataSource.createCacheProduct(remoteProduct);
        return Right(remoteProduct);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final product = await localDataSource.getProduct(productId);
        return Right(product);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }
}
