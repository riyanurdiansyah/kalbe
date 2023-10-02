import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalbe/core/dialog.dart';
import 'package:kalbe/presentation/controllers/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:kalbe/presentation/pages/empty_page.dart';

class PembelianPage extends StatelessWidget {
  PembelianPage({super.key});

  final _homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembelian"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => AppDialog.dialogAddPembelians(),
            icon: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (_homeC.pembelians.isEmpty) {
          return const EmptyPage();
        }

        return ListView(
          children: List.generate(
            _homeC.pembelians.length,
            (index) => ListTile(
              title: Text(
                "${_homeC.pembelians[index].intSalesOrderID.toString()} - ${_homeC.pembelians[index].product.txtProductName}",
              ),
              subtitle: Text(
                _homeC.pembelians[index].customer.txtCustomerName,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${_homeC.pembelians[index].intQty} pcs",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateFormat.yMMMd("id").format(
                      DateTime.parse(
                        _homeC.pembelians[index].dtSalesOrder,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
