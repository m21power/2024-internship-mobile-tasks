import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/exception.dart';
import '../../models/product_model.dart';

abstract class LocalDataSources {
  /// Returns cache exception if there is no data in the cache
  Future<ProductModel> getProduct();
  Future<void> createCacheProduct(ProductModel product);
}

class LocalDataSourcesImpl implements LocalDataSources {
  final SharedPreferences sharedPreferences;
  LocalDataSourcesImpl({required this.sharedPreferences});

  @override
  Future<ProductModel> getProduct() {
    final jsonString = sharedPreferences.getString('CACHE_PRODUCT');
    if (jsonString != null) {
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> createCacheProduct(ProductModel productModel) {
    return sharedPreferences.setString(
      'CACHE_PRODUCT',
      json.encode(productModel.toJson()),
    );
  }
}
