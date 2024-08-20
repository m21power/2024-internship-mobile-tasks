import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/core/exception.dart';
import 'package:myfirst_app/features/product/data/data_sources/local_data_sources/local_data_sources.dart';
import 'package:myfirst_app/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalDataSourcesImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = LocalDataSourcesImpl(sharedPreferences: mockSharedPreferences);
  });
  group('get last product', () {
    final tProductModel =
        ProductModel.fromJson(json.decode(fixture('product_cached.json')));
    test(
        'should return product from shared preferences when there is one in the cache',
        () async {
      when(mockSharedPreferences.getString('CACHE_PRODUCT'))
          .thenReturn(fixture('product_cached.json'));

      final result = await dataSource.getProduct();

      verify(mockSharedPreferences.getString('CACHE_PRODUCT'));

      expect(result, equals(tProductModel));
    });
  });
  test('should throw cached exception if not in cached value', () {
    when(mockSharedPreferences.getString('CACHE_PRODUCT')).thenReturn(null);

    final call = dataSource.getProduct;

    expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
  });
}
