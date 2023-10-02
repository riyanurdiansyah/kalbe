import 'package:dio/dio.dart';
import 'package:kalbe/core/constanta.dart';
import 'package:kalbe/data/datasources/remote/customer_remote_data_source.dart';
import 'package:kalbe/data/models/customer.dart';

import '../../../core/exception.dart';

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  late Dio dio;

  CustomerRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<bool> addCustomer(Map<String, dynamic> customer) async {
    final response = await dio.post(
      customerUrl,
      data: customer,
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
  Future<List<CustomerModel>> getCustomer() async {
    List<CustomerModel> customers = [];
    final response = await dio.get(customerUrl);
    if (response.statusCode == 200) {
      for (var data in response.data["data"]) {
        customers.add(CustomerModel.fromJson(data));
      }
      return customers;
    }

    throw CustomException(
      response.statusCode ?? 500,
      response.data["message"] ??
          response.statusMessage ??
          "Something went wrong...",
    );
  }
}
