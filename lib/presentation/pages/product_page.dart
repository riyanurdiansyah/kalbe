import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalbe/core/dialog.dart';

import '../controllers/home_controller.dart';
import 'empty_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final _homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => AppDialog.dialogAddProduct(),
            icon: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (_homeC.products.isEmpty) {
          return const EmptyPage();
        }

        return ListView(
          children: List.generate(
            _homeC.products.length,
            (index) => ListTile(
                title: Text(
                  "${_homeC.products[index].intProductID}",
                ),
                subtitle: Text(
                  "${_homeC.products[index].txtProductCode} - ${_homeC.products[index].txtProductName}",
                ),
                trailing: Text(
                  DateFormat.yMMMd("id").format(
                    DateTime.parse(
                      _homeC.products[index].dtInserted,
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}
