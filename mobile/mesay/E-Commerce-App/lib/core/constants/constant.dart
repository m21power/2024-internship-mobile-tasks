import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../features/product/data/models/product_model.dart';
import '../exception.dart';

class Url {
  static const String url =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  Future<ProductModel> searchbyId(String id) async {
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    int statusCode = jsonData['statusCode'];
    String message = jsonData['message'];
    List<dynamic> data = jsonData['data'];
    if (statusCode == 200) {
      for (var i = 0; i < data.length; i++) {
        if (data[i]['id'] == id) {
          return ProductModel.fromJson(data[i]);
        }
      }
      throw ServerException('Product not found');
    } else {
      throw ServerException(message);
    }
  }
}
