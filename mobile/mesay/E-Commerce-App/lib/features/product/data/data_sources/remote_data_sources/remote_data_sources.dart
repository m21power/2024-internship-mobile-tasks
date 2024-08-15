import '../../models/product_model.dart';

abstract class RemoteDataSource {
  /// Retrieves a product from the server based on the provided [productId].
  ///
  /// Returns a [Future] that completes with the retrieved [ProductModel].
  Future<ProductModel> getProduct(String productId);

  /// Creates a new product on the server using the provided [product] data.
  ///
  /// Throws a [ServerException] if an error occurs while creating the product.
  Future<void> createProduct(ProductModel product);

  /// Updates an existing product on the server using the provided [product] data.
  ///
  ///  Throws a [ServerException] if an error occurs while deleting the product.
  Future<void> updateProduct(ProductModel product);

  /// Deletes a product from the server based on the provided [productId].
  ///
  /// Throws a [ServerException] if an error occurs while deleting the product.
  Future<void> deleteProduct(String productId);
}
