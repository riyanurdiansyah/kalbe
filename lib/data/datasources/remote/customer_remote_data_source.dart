import '../../models/customer.dart';

abstract class CustomerRemoteDataSource {
  Future<List<CustomerModel>> getCustomer();

  Future<CustomerModel> addCustomer(CustomerModel customer);
}
