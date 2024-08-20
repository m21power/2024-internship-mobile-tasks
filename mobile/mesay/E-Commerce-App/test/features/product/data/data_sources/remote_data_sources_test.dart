import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/core/exception.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';
import 'package:myfirst_app/features/product/data/models/product_model.dart';
import 'package:myfirst_app/features/product/domain/entities/product_entity.dart';

import '../../../fixtures/fixtures_reader.dart';
import '../../test_helper.mocks.dart';

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
  test('Create Product - Failure', () async {
    // Arrange
    final product = ProductEntity(
        productId: '1234567889999',
        name: 'name',
        description: 'description',
        price: 2344,
        imageUrl: 'assets/images/my_image.png');

    when(mockHttpClient.post(
      Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response('', 400));

    // Act & Assert
    expect(() => remoteDataSourcesImpl.createProduct(product),
        throwsA(isA<ServerException>()));
  });

// tests for updating product
  group('Update Product', () {
    test('Update Product - Success', () async {
      // Arrange
      final mockResponse = http.Response('{"success": true}', 200);

      final product = ProductEntity(
          productId: '1234567889999',
          name: 'name',
          description: 'description',
          price: 2344,
          imageUrl: 'assets/images/my_image.png');

      when(mockHttpClient.put(
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

      // Act
      await remoteDataSourcesImpl.updateProduct(product);

      // Assert
      verify(mockHttpClient.put(
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
      )).called(1);
    });
    test('Update Product - Failure', () async {
      // Arrange
      final product = ProductEntity(
        productId: '1234567889999',
        name: 'name',
        description: 'description for updating',
        price: 2344.0,
        imageUrl: 'assets/images/my_image.png',
      );
      final mockResponse = http.Response('{"success": false}', 400);

      when(mockHttpClient.put(
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
      expect(() => remoteDataSourcesImpl.updateProduct(product),
          throwsA(isA<ServerException>()));
    });
  });
  // tests for deleting product
  group('Delete Product', () {
    test('Delete Product - Success', () async {
      // Arrange
      final productId = '1234567889999';
      final mockResponse = http.Response('{"success": true}', 200);

      when(mockHttpClient.delete(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$productId'),
      )).thenAnswer((_) async => mockResponse);

      // Act
      await remoteDataSourcesImpl.deleteProduct(productId);

      // Assert
      verify(mockHttpClient.delete(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$productId'),
      )).called(1);
    });

    test('Delete Product - Failure', () async {
      // Arrange
      final productId = '1234567889999';
      final mockResponse = http.Response('{"success": false}', 400);

      when(mockHttpClient.delete(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$productId'),
      )).thenAnswer((_) async => mockResponse);

      // Act & Assert
      expect(() => remoteDataSourcesImpl.deleteProduct(productId),
          throwsA(isA<ServerException>()));
    });
  });
}
