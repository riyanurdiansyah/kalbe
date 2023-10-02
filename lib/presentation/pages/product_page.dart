import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

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
            onPressed: () {},
            icon: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
      body: Obx(
        () => ListView(
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
        ),
      ),
    );
  }
}
