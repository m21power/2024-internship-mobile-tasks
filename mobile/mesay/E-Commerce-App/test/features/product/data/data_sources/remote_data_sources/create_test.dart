import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/core/exception.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';
import 'package:myfirst_app/features/product/domain/entities/product_entity.dart';

import '../../../test_helper.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late RemoteDataSourcesImpl remoteDataSourcesImpl;

  setUp(() {
    mockHttpClient = MockClient();
    remoteDataSourcesImpl = RemoteDataSourcesImpl(client: mockHttpClient);
  });

  group('Create Product', () {
    test('create product - success', () async {
      // Arrange
      final product = ProductEntity(
        productId: '1234567889999',
        name: 'name',
        description: 'description',
        price: 2344,
        imageUrl: 'assets/images/my_image.png',
      );
      final mockResponse = http.Response('{"success": true}', 201);

      when(mockHttpClient.post(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(product.toJson()),
      )).thenAnswer((_) async => mockResponse);

      // Act
      await remoteDataSourcesImpl.createProduct(product);

      // Assert
      verify(mockHttpClient.post(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(product.toJson()),
      )).called(1);
    });

    test('create product - failure', () async {
      // Arrange
      final product = ProductEntity(
        productId: '1234567889999',
        name: 'name',
        description: 'description',
        price: 2344,
        imageUrl: 'assets/images/my_image.png',
      );
      var mockResponse = http.Response('{"success": false}', 400);

      when(mockHttpClient.post(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({
          'productId': product.productId,
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        }),
      )).thenAnswer((_) async => mockResponse);

      // Act & Assert
      expect(() => remoteDataSourcesImpl.createProduct(product),
          throwsA(isA<ServerException>()));
    });
  });
}
