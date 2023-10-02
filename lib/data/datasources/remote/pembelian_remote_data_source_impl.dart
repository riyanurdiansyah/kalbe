import 'package:dio/dio.dart';
import 'package:kalbe/core/constanta.dart';
import 'package:kalbe/data/datasources/remote/pembelian_remote_data_source.dart';
import 'package:kalbe/data/models/pembelian.dart';

import '../../../core/exception.dart';

class PembelianRemoteDataSourceImpl implements PembelianRemoteDataSource {
  late Dio dio;

  PembelianRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<bool> addPembelian(Map<String, dynamic> pembelian) async {
    final response = await dio.post(
      pembelianUrl,
      data: pembelian,
    );
    if (response.statusCode == 201) {
      return true;
    }

    throw CustomException(
      response.statusCode ?? 500,
      response.data["message"] ??
          response.statusMessage ??
          "Something went wrong...",
    );
  }

  @override
  Future<List<PembelianModel>> getPembelian() async {
    List<PembelianModel> pembelians = [];
    final response = await dio.get(pembelianUrl);
    if (response.statusCode == 200) {
      for (var data in response.data["data"]) {
        pembelians.add(PembelianModel.fromJson(data));
      }
      return pembelians;
    }

    throw CustomException(
      response.statusCode ?? 500,
      response.data["message"] ??
          response.statusMessage ??
          "Something went wrong...",
    );
  }
}
