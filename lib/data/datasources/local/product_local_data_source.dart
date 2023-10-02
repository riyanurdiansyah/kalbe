import 'package:kalbe/data/models/product.dart';

abstract class ProductLocalDataSource {
  Future<String> saveProductToCache(List<ProductModel> brands);

  Future<List<ProductModel>> getProductsFromCache();
}
