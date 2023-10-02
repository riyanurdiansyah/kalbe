import 'package:kalbe/data/models/customer.dart';

abstract class CustomerLocalDataSource {
  Future<String> saveCustomerToCache(List<CustomerModel> customers);

  Future<List<CustomerModel>> getCustomersFromCache();
}
