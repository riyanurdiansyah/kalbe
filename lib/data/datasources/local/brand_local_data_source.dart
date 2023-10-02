import '../../models/brand.dart';

abstract class BrandLocalDataSource {
  Future<String> saveBrandToCache(List<BrandModel> brands);

  Future<List<BrandModel>> getBrandsFromCache();
}
