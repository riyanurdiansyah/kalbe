import 'package:kalbe/data/models/product.dart';

class ProductEntity {
  final int intProductID;
  final String txtProductCode;
  final String txtProductName;
  final int intBrandID;
  final String dtInserted;
  final String dtUpdated;

  ProductEntity({
    required this.intProductID,
    required this.txtProductCode,
    required this.txtProductName,
    required this.intBrandID,
    required this.dtInserted,
    required this.dtUpdated,
  });

  static ProductModel toProductModel(ProductEntity product) {
    return ProductModel(
      intBrandID: product.intBrandID,
      intProductID: product.intProductID,
      txtProductCode: product.txtProductCode,
      txtProductName: product.txtProductName,
      dtInserted: product.dtInserted,
      dtUpdated: product.dtUpdated,
    );
  }
}
