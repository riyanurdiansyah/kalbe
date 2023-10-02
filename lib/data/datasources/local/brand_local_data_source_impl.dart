import 'package:kalbe/core/exception.dart';
import 'package:kalbe/data/datasources/local/brand_local_data_source.dart';
import 'package:kalbe/data/models/brand.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandLocalDataSourceImpl implements BrandLocalDataSource {
  final SharedPreferences prefs;

  BrandLocalDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<List<BrandModel>> getBrandsFromCache() async {
    final jsonString = prefs.getString("CACHED_BRAND");

    if (jsonString != null) {
      return BrandModel.decode(jsonString);
    }

    throw CustomException(404, "CACHED_BRAND is not found");
  }

  @override
  Future<String> saveBrandToCache(List<BrandModel> brands) {
    final encodedData = BrandModel.encode(brands);
    prefs.setString("CACHED_BRAND", encodedData);

    return Future.value(encodedData);
  }
}
