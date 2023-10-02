import 'dart:convert';

import 'package:kalbe/business/entities/pembelian.dart';
import 'package:kalbe/data/models/customer.dart';
import 'package:kalbe/data/models/product.dart';

class PembelianModel extends PembelianEntity {
  PembelianModel({
    required int intSalesOrderID,
    required int intCustomerID,
    required int intProductID,
    required int intQty,
    required String dtSalesOrder,
    required String dtUpdated,
    required CustomerModel customer,
    required ProductModel product,
  }) : super(
          intCustomerID: intCustomerID,
          intProductID: intProductID,
          intQty: intQty,
          intSalesOrderID: intSalesOrderID,
          dtSalesOrder: dtSalesOrder,
          dtUpdated: dtUpdated,
          customer: customer,
          product: product,
        );

  factory PembelianModel.fromJson(Map<String, dynamic> json) {
    return PembelianModel(
      intCustomerID: json["intCustomerID"],
      intProductID: json["intProductID"],
      intSalesOrderID: json["intSalesOrderID"],
      intQty: json["intQty"],
      dtSalesOrder: json["dtSalesOrder"],
      dtUpdated: json["dtUpdated"],
      customer: CustomerModel.fromJson(json["customer"]),
      product: ProductModel.fromJson(json["product"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "intCustomerID": intCustomerID,
      "intProductID": intProductID,
      "intSalesOrderID": intSalesOrderID,
      "intQty": intQty,
      "dtSalesOrder": dtSalesOrder,
      "dtUpdated": dtUpdated,
    };
  }

  static String encode(List<PembelianModel> pembelians) => json.encode(
        pembelians
            .map<Map<String, dynamic>>((pembelian) => pembelian.toJson())
            .toList(),
      );

  static List<PembelianModel> decode(String pembelians) =>
      (json.decode(pembelians) as List<dynamic>)
          .map<PembelianModel>((item) => PembelianModel.fromJson(item))
          .toList();
}
