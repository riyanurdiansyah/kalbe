import 'package:kalbe/data/models/brand.dart';

class BrandEntity {
  final int intBrandID;
  final String txtBrandName;
  final String dtInserted;
  final String dtUpdated;

  BrandEntity({
    required this.intBrandID,
    required this.txtBrandName,
    required this.dtInserted,
    required this.dtUpdated,
  });

  static BrandModel toBrandModel(BrandEntity brand) {
    return BrandModel(
      intBrandID: brand.intBrandID,
      txtBrandName: brand.txtBrandName,
      dtInserted: brand.dtInserted,
      dtUpdated: brand.dtUpdated,
    );
  }
}
