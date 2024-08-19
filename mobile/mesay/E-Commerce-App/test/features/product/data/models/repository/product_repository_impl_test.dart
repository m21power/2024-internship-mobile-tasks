import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/features/product/data/models/product_model.dart';
import 'package:myfirst_app/features/product/data/repository/product_repository_Impl.dart';

import '../../../test_helper.mocks.dart';

void main() {
  late ProductRepositoryImp repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSources mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSources();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImp(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('create a new product', () {
    test('should check if the device is online', () async {
      final tProductModel = ProductModel(
        productId: '1',
        name: 'shoe',
        description: 'description',
        price: 399,
        imageUrl: 'mobile/mesay/E-Commerce-App/assets/shoe.jpeg',
      );
      final tProductEntity = tProductModel;

      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Act
      await repository.createProduct(tProductEntity);

      // Assert
      verify(mockNetworkInfo.isConnected);
    });
  });
}
