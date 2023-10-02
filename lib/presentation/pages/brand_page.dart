import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalbe/core/dialog.dart';

import '../controllers/home_controller.dart';
import 'empty_page.dart';

class BrandPage extends StatelessWidget {
  BrandPage({super.key});

  final _homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brand"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => AppDialog.dialogAddBrand(),
            icon: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (_homeC.brands.isEmpty) {
          return const EmptyPage();
        }

        return ListView(
          children: List.generate(
            _homeC.brands.length,
            (index) => ListTile(
                title: Text(
                  "${_homeC.brands[index].intBrandID}",
                ),
                subtitle: Text(
                  _homeC.brands[index].txtBrandName,
                ),
                trailing: Text(
                  DateFormat.yMMMd("id").format(
                    DateTime.parse(
                      _homeC.brands[index].dtInserted,
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}
