import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalbe/presentation/pages/brand_page.dart';
import 'package:kalbe/presentation/pages/customer_page.dart';
import 'package:kalbe/presentation/pages/pembelian_page.dart';

import '../controllers/home_controller.dart';
import 'product_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_homeC.indexTab.value == 0) {
          return PembelianPage();
        }
        if (_homeC.indexTab.value == 1) {
          return BrandPage();
        }
        if (_homeC.indexTab.value == 2) {
          return ProductPage();
        }
        return CustomerPage();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: _homeC.onTapMenu,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          currentIndex: _homeC.indexTab.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
