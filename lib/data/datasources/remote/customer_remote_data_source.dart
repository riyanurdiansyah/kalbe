import '../../models/customer.dart';

abstract class CustomerRemoteDataSource {
  Future<List<CustomerModel>> getCustomer();

  Future<bool> addCustomer(Map<String, dynamic> customer);
}
