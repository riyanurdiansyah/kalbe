import 'package:kalbe/business/entities/customer.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/data/models/customer.dart';
import 'package:kalbe/data/models/product.dart';

import '../../data/models/pembelian.dart';

class PembelianEntity {
  final int intSalesOrderID;
  final int intCustomerID;
  final int intProductID;
  final int intQty;
  final String dtSalesOrder;
  final String dtUpdated;
  final CustomerEntity customer;
  final ProductEntity product;

  PembelianEntity({
    required this.intSalesOrderID,
    required this.intCustomerID,
    required this.intProductID,
    required this.intQty,
    required this.dtSalesOrder,
    required this.dtUpdated,
    required this.customer,
    required this.product,
  });

  static PembelianModel toPembelianModel(PembelianEntity pembelian) {
    return PembelianModel(
      intCustomerID: pembelian.intCustomerID,
      intProductID: pembelian.intProductID,
      intSalesOrderID: pembelian.intSalesOrderID,
      intQty: pembelian.intQty,
      dtSalesOrder: pembelian.dtSalesOrder,
      dtUpdated: pembelian.dtUpdated,
      customer: CustomerModel(
        intCustomerID: pembelian.customer.intCustomerID,
        txtCustomerName: pembelian.customer.txtCustomerName,
        txtCustomerAddress: pembelian.customer.txtCustomerAddress,
        bitGender: pembelian.customer.bitGender,
        dtInserted: pembelian.customer.dtInserted,
        dtUpdated: pembelian.customer.dtUpdated,
      ),
      product: ProductModel(
        intProductID: pembelian.product.intProductID,
        txtProductCode: pembelian.product.txtProductCode,
        txtProductName: pembelian.product.txtProductName,
        intBrandID: pembelian.product.intBrandID,
        dtInserted: pembelian.product.dtInserted,
        dtUpdated: pembelian.product.dtUpdated,
      ),
    );
  }
}
