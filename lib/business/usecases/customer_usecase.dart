import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/customer.dart';
import 'package:kalbe/business/repositories/customer_repository.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/customer.dart';

class GetCustomer {
  final CustomerRepository repository;

  GetCustomer(this.repository);

  Future<Either<CustomFailure, List<CustomerEntity>>> call() async {
    return await repository.getCustomer();
  }
}

class AddCustomer {
  final CustomerRepository repository;

  AddCustomer(this.repository);

  Future<Either<CustomFailure, bool>> call(Map<String, dynamic> brand) async {
    return await repository.addCustomer(brand);
  }
}

class AddCustomerToCache {
  final CustomerRepository repository;

  AddCustomerToCache(this.repository);

  Future<Either<CustomFailure, String>> call(
      List<CustomerEntity> brands) async {
    List<CustomerModel> brandsModel = [];
    for (var data in brands) {
      brandsModel.add(CustomerEntity.toCustomerModel(data));
    }
    return await repository.addCustomerToCache(brandsModel);
  }
}
