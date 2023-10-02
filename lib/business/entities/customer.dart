import '../../data/models/customer.dart';

class CustomerEntity {
  final int intCustomerID;
  final String txtCustomerName;
  final String txtCustomerAddress;
  final int bitGender;
  final String dtInserted;
  final String dtUpdated;

  CustomerEntity({
    required this.intCustomerID,
    required this.txtCustomerName,
    required this.txtCustomerAddress,
    required this.bitGender,
    required this.dtInserted,
    required this.dtUpdated,
  });

  static CustomerModel toCustomerModel(CustomerEntity customer) {
    return CustomerModel(
      intCustomerID: customer.intCustomerID,
      txtCustomerAddress: customer.txtCustomerAddress,
      txtCustomerName: customer.txtCustomerName,
      bitGender: customer.bitGender,
      dtInserted: customer.dtInserted,
      dtUpdated: customer.dtUpdated,
    );
  }
}
