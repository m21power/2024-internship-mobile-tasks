import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String productId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductEntity({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [productId, name, description, price, imageUrl];
}
