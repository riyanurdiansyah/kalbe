import 'package:kalbe/core/exception.dart';
import 'package:kalbe/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'product_local_data_source.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences prefs;

  ProductLocalDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<List<ProductModel>> getProductsFromCache() async {
    final jsonString = prefs.getString("CACHED_PRODUCT");

    if (jsonString != null) {
      return ProductModel.decode(jsonString);
    }

    throw CustomException(404, "CACHED_PRODUCT is not found");
  }

  @override
  Future<String> saveProductToCache(List<ProductModel> products) {
    final encodedData = ProductModel.encode(products);
    prefs.setString("CACHED_PRODUCT", encodedData);

    return Future.value(encodedData);
  }
}
