import 'dart:convert';

import 'package:kalbe/business/entities/customer.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required int intCustomerID,
    required String txtCustomerName,
    required String txtCustomerAddress,
    required int bitGender,
    required String dtInserted,
    required String dtUpdated,
  }) : super(
          intCustomerID: intCustomerID,
          txtCustomerAddress: txtCustomerAddress,
          txtCustomerName: txtCustomerName,
          bitGender: bitGender,
          dtInserted: dtInserted,
          dtUpdated: dtUpdated,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      intCustomerID: json["intCustomerID"],
      txtCustomerName: json["txtCustomerName"],
      txtCustomerAddress: json["txtCustomerAddress"],
      bitGender: json["bitGender"],
      dtInserted: json["dtInserted"],
      dtUpdated: json["dtUpdated"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "intCustomerID": intCustomerID,
      "txtCustomerName": txtCustomerName,
      "txtCustomerAddress": txtCustomerAddress,
      "bitGender": bitGender,
      "dtInserted": dtInserted,
      "dtUpdated": dtUpdated,
    };
  }

  static String encode(List<CustomerModel> customers) => json.encode(
        customers
            .map<Map<String, dynamic>>((customer) => customer.toJson())
            .toList(),
      );

  static List<CustomerModel> decode(String customers) =>
      (json.decode(customers) as List<dynamic>)
          .map<CustomerModel>((item) => CustomerModel.fromJson(item))
          .toList();
}
