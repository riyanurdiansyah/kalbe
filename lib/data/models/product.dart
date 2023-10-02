import 'dart:convert';

import '../../business/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int intProductID,
    required String txtProductCode,
    required String txtProductName,
    required int intBrandID,
    required String dtInserted,
    required String dtUpdated,
  }) : super(
          intProductID: intProductID,
          txtProductCode: txtProductCode,
          txtProductName: txtProductName,
          intBrandID: intBrandID,
          dtInserted: dtInserted,
          dtUpdated: dtUpdated,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      intBrandID: json["intBrandID"],
      intProductID: json["intProductID"],
      txtProductCode: json["txtProductCode"],
      txtProductName: json["txtProductName"],
      dtInserted: json["dtInserted"],
      dtUpdated: json["dtUpdated"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "intBrandID": intBrandID,
      "intProductID": intProductID,
      "txtProductCode": txtProductCode,
      "txtProductName": txtProductName,
      "dtInserted": dtInserted,
      "dtUpdated": dtUpdated,
    };
  }

  static String encode(List<ProductModel> products) => json.encode(
        products
            .map<Map<String, dynamic>>((product) => product.toJson())
            .toList(),
      );

  static List<ProductModel> decode(String products) =>
      (json.decode(products) as List<dynamic>)
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();
}
