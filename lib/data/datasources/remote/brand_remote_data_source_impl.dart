import 'package:kalbe/core/constanta.dart';
import 'package:kalbe/core/exception.dart';
import 'package:kalbe/data/models/brand.dart';
import 'package:dio/dio.dart';
import 'brand_remote_data_source.dart';

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  late Dio dio;

  BrandRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<BrandModel> addBrand(Map<String, dynamic> brand) async {
    final response = await dio.post(
      brandUrl,
      data: brand,
    );
    if (response.statusCode == 201) {
      return BrandModel.fromJson(response.data["data"]);
    }

    throw CustomException(
      response.statusCode ?? 500,
      response.data["message"] ??
          response.statusMessage ??
          "Something went wrong...",
    );
  }

  @override
  Future<List<BrandModel>> getBrand() async {
    List<BrandModel> brands = [];
    final response = await dio.get(brandUrl);
    if (response.statusCode == 200) {
      for (var data in response.data["data"]) {
        brands.add(BrandModel.fromJson(data));
      }
      return brands;
    }

    throw CustomException(
      response.statusCode ?? 500,
      response.data["message"] ??
          response.statusMessage ??
          "Something went wrong...",
    );
  }
}
