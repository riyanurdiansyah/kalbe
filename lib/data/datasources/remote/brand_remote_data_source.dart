import '../../models/brand.dart';

abstract class BrandRemoteDataSource {
  Future<List<BrandModel>> getBrand();

  Future<BrandModel> addBrand(Map<String, dynamic> brand);
}
