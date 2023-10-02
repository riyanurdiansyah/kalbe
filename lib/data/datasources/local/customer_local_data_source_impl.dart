import 'package:kalbe/data/datasources/local/customer_local_data_source.dart';
import 'package:kalbe/data/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/exception.dart';

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  final SharedPreferences prefs;

  CustomerLocalDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<String> saveCustomerToCache(List<CustomerModel> customers) {
    final encodedData = CustomerModel.encode(customers);
    prefs.setString("CACHED_CUSTOMER", encodedData);

    return Future.value(encodedData);
  }

  @override
  Future<List<CustomerModel>> getCustomersFromCache() async {
    final jsonString = prefs.getString("CACHED_CUSTOMER");

    if (jsonString != null) {
      return CustomerModel.decode(jsonString);
    }

    throw CustomException(404, "CACHED_CUSTOMER is not found");
  }
}
