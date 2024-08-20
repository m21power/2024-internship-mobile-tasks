import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/exception.dart';
import '../../../domain/entities/product_entity.dart';
import '../../models/product_model.dart';

abstract class RemoteDataSource {
  /// should call https://g5-flutter-learning-path-be.onrender.com/api/v2/products to get the product
  /// should return ProductModel
  ///
  Future<ProductModel> getProduct(String productId);

  /// should call https://g5-flutter-learning-path-be.onrender.com/api/v2/products to create the product
  ///
  Future<void> createProduct(ProductEntity product);

  /// should call https://g5-flutter-learning-path-be.onrender.com/api/v2/products/? to update the product
  ///
  Future<void> updateProduct(ProductEntity product);

  /// should call https://g5-flutter-learning-path-be.onrender.com/api/v2/products/? to delete the product
  ///
  Future<void> deleteProduct(String productId);
}

class RemoteDataSourcesImpl implements RemoteDataSource {
  http.Client client;
  RemoteDataSourcesImpl({required this.client});
  @override
  Future<ProductModel> getProduct(String productId) async {
    try {
      final response = await client.get(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$productId'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ProductModel.fromJson(jsonData);
      } else {
        throw ServerException('Failed to load product');
      }
    } catch (e) {
      throw ServerException('Failed to connect to the server');
    }
  }

  @override
  Future<void> createProduct(ProductEntity product) {
    final url = Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products');
    return client
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    )
        .then((value) {
      if (value.statusCode != 201) {
        throw ServerException('Failed to create product');
      }
    });
  }

  @override
  Future<void> deleteProduct(String productId) {
    final url = Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$productId');
    return client.delete(url).then((value) {
      if (value.statusCode != 200) {
        throw ServerException('Failed to delete product');
      }
    });
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    final url = Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products');
    try {
      final response = await client.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException('Failed to update product');
      }
    } catch (e) {
      throw ServerException('Failed to connect to the server');
    }
  }
}
