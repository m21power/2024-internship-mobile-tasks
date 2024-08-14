import 'package:flutter_test/flutter_test.dart';
import 'package:myfirst_app/features/product/data/models/product_model.dart';
import 'package:myfirst_app/features/product/domain/entities/product_entity.dart';

void main() {
  var testProductModel = ProductModel(
    productId: '1',
    name: 'product',
    price: 100,
    description: 'description',
    imageUrl: 'image',
  );

  test('should be subclass of product entity', () async {
    expect(testProductModel, isA<ProductEntity>());
  });

  test('should convert to JSON correctly', () async {
    final json = testProductModel.toJson();
    expect(json['id'], testProductModel.productId);
    expect(json['name'], testProductModel.name);
    expect(json['description'], testProductModel.description);
    expect(json['price'], testProductModel.price);
    expect(json['imageUrl'], testProductModel.imageUrl);
  });
}
