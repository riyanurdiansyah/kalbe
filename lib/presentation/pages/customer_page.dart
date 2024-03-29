import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalbe/core/dialog.dart';

import '../controllers/home_controller.dart';
import 'empty_page.dart';

class CustomerPage extends StatelessWidget {
  CustomerPage({super.key});

  final _homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => AppDialog.dialogAddCustomer(),
            icon: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (_homeC.customers.isEmpty) {
          return const EmptyPage();
        }
        return ListView(
          children: List.generate(_homeC.customers.length, (index) {
            String gender = "";
            if (_homeC.customers[index].bitGender == 0) {
              gender = "Perempuan";
            } else {
              gender = "Laki-laki";
            }
            return ListTile(
              title: Text(
                "${_homeC.customers[index].intCustomerID}",
              ),
              subtitle: Text(
                "${_homeC.customers[index].txtCustomerName} - $gender",
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _homeC.customers[index].txtCustomerAddress,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateFormat.yMMMd("id").format(
                      DateTime.parse(
                        _homeC.customers[index].dtInserted,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
