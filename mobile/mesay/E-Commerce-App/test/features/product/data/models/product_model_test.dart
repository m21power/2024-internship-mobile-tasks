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

  test('should create a product model from JSON', () async {
    final json = {
      'id': '2',
      'name': 'another product',
      'description': 'another description',
      'price': 200,
      'imageUrl': 'another image',
    };
    final productModel = ProductModel.fromJson(json);
    expect(productModel.productId, json['id']);
    expect(productModel.name, json['name']);
    expect(productModel.description, json['description']);
    expect(productModel.price, json['price']);
    expect(productModel.imageUrl, json['imageUrl']);
  });

//   test('should update product model properties', () async {
//     testProductModel.name = 'updated product';
//     testProductModel.description = 'updated description';
//     testProductModel.price = 150;
//     testProductModel.imageUrl = 'updated image';

//     expect(testProductModel.name, 'updated product');
//     expect(testProductModel.description, 'updated description');
//     expect(testProductModel.price, 150);
//     expect(testProductModel.imageUrl, 'updated image');
//   });
// }
}
