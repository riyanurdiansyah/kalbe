import 'package:kalbe/data/models/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProduct();

  Future<bool> addProduct(Map<String, dynamic> product);
}
