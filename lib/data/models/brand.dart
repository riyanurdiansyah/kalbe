import 'dart:convert';

import 'package:kalbe/business/entities/brand.dart';

class BrandModel extends BrandEntity {
  BrandModel({
    required int intBrandID,
    required String txtBrandName,
    required String dtInserted,
    required String dtUpdated,
  }) : super(
          dtInserted: dtInserted,
          dtUpdated: dtUpdated,
          intBrandID: intBrandID,
          txtBrandName: txtBrandName,
        );

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      intBrandID: json["intBrandID"],
      txtBrandName: json["txtBrandName"],
      dtInserted: json["dtInserted"],
      dtUpdated: json["dtUpdated"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "intBrandID": intBrandID,
      "txtBrandName": txtBrandName,
      "dtInserted": dtInserted,
      "dtUpdated": dtUpdated,
    };
  }

  static String encode(List<BrandModel> brands) => json.encode(
        brands.map<Map<String, dynamic>>((music) => music.toJson()).toList(),
      );

  static List<BrandModel> decode(String brands) =>
      (json.decode(brands) as List<dynamic>)
          .map<BrandModel>((item) => BrandModel.fromJson(item))
          .toList();
}
