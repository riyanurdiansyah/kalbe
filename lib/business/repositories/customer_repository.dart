import 'package:dartz/dartz.dart';

import '../../core/faiures.dart';
import '../../data/models/customer.dart';
import '../entities/customer.dart';

abstract class CustomerRepository {
  Future<Either<CustomFailure, List<CustomerEntity>>> getCustomer();

  Future<Either<CustomFailure, bool>> addCustomer(
      Map<String, dynamic> customer);

  Future<Either<CustomFailure, String>> addCustomerToCache(
      List<CustomerModel> customer);
}
