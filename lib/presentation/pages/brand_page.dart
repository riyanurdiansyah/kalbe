import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

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
        ),
      ),
    );
  }
}
