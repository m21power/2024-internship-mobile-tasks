import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/core/exception.dart';
import 'package:myfirst_app/features/product/data/data_sources/remote_data_sources/remote_data_sources.dart';

import '../../../test_helper.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late RemoteDataSourcesImpl remoteDataSourcesImpl;

  setUp(() {
    mockHttpClient = MockClient();
    remoteDataSourcesImpl = RemoteDataSourcesImpl(client: mockHttpClient);
  });

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
