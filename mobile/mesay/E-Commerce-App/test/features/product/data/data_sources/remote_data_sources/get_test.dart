import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/core/exception.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';
import 'package:myfirst_app/features/product/data/models/product_model.dart';

import '../../../../fixtures/fixtures_reader.dart';
import '../../../test_helper.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late RemoteDataSourcesImpl remoteDataSourcesImpl;

  setUp(() {
    mockHttpClient = MockClient();
    remoteDataSourcesImpl = RemoteDataSourcesImpl(client: mockHttpClient);
  });

  group('Get Product', () {
    final productId = '66c45a0b6198f150e643c9b1';
    var mockResponse = http.Response(fixture('product_cached.json'), 200);

    test('Get Product - Success', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$productId')))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await remoteDataSourcesImpl.getProduct(productId);

      // Assert
      expect(result, isA<ProductModel>());
    });

    test('Get Product - Failure', () async {
      // Arrange
      mockResponse = http.Response('bad request', 404);
      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$productId')))
          .thenAnswer((_) async => mockResponse);
      var result = remoteDataSourcesImpl.getProduct(productId);
      // Act
      expect(result, throwsA(isA<ServerException>()));
    });

    test('Get Product - Exception', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$productId')))
          .thenThrow(Exception('Failed to connect'));
      var result = remoteDataSourcesImpl.getProduct(productId);
      // Act
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
