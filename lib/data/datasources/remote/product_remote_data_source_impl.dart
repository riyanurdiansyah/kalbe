import 'package:dio/dio.dart';
import 'package:kalbe/core/constanta.dart';
import 'package:kalbe/data/datasources/remote/product_remote_data_source.dart';
import 'package:kalbe/data/models/product.dart';

import '../../../core/exception.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  late Dio dio;

  ProductRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    final response = await dio.post(
      productUrl,
      data: product.toJson(),
    );
    if (response.statusCode == 201) {
      return ProductModel.fromJson(response.data["data"]);
    }

    throw CustomException(
      response.statusCode ?? 500,
      response.data["message"] ??
          response.statusMessage ??
          "Something went wrong...",
    );
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> brands = [];
    final response = await dio.get(productUrl);
    if (response.statusCode == 200) {
      for (var data in response.data["data"]) {
        brands.add(ProductModel.fromJson(data));
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
