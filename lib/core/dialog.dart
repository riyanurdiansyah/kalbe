import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalbe/business/entities/brand.dart';
import 'package:kalbe/business/entities/customer.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/presentation/controllers/home_controller.dart';

class AppDialog {
  static dialogAddPembelians() {
    final homeC = Get.put(HomeController());
    return Get.defaultDialog(
      title: "Add Pembelian",
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Product"),
              const SizedBox(
                height: 6,
              ),
              DropdownSearch<ProductEntity>(
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Masukkan nama produk",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                asyncItems: (String filter) =>
                    homeC.productRemoteDataSource.getProduct(),
                itemAsString: (ProductEntity u) => u.txtProductName,
                onChanged: (ProductEntity? data) {
                  homeC.productId = data?.intProductID ?? 0;
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Customer"),
              const SizedBox(
                height: 6,
              ),
              DropdownSearch<CustomerEntity>(
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Masukkan nama customer",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                asyncItems: (String filter) =>
                    homeC.customerRemoteDataSource.getCustomer(),
                itemAsString: (CustomerEntity u) => u.txtCustomerName,
                onChanged: (CustomerEntity? data) {
                  homeC.customerId = data?.intCustomerID ?? 0;
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("QTY"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                // controller: invoiceBloc.tcQtyProduk,
                // validator: (val) => Validators.requiredField(val!),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (val) {
                  homeC.qty = int.parse(val);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => homeC.addPembelian(),
                  child: const Text("Tambah"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static dialogAddBrand() {
    final homeC = Get.put(HomeController());
    return Get.defaultDialog(
      title: "Add Brand",
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nama Brand"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: homeC.tcNamaBrand,
                // validator: (val) => Validators.requiredField(val!),
                onChanged: (val) {
                  homeC.qty = int.parse(val);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => homeC.addBrand(),
                  child: const Text("Tambah"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static dialogAddCustomer() {
    final homeC = Get.put(HomeController());
    return Get.defaultDialog(
      title: "Add Customer",
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nama"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: homeC.tcNamaCustomer,
                // validator: (val) => Validators.requiredField(val!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Alamat"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: homeC.tcAlamatCustomer,
                // validator: (val) => Validators.requiredField(val!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => RadioListTile(
                  title: const Text("Perempuan"),
                  value: 0,
                  groupValue: homeC.bitGender.value,
                  onChanged: (value) {
                    homeC.bitGender.value = value ?? 99;
                  },
                ),
              ),
              Obx(
                () => RadioListTile(
                  title: const Text("Laki-laki"),
                  value: 1,
                  groupValue: homeC.bitGender.value,
                  onChanged: (value) {
                    homeC.bitGender.value = value ?? 99;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => homeC.addCustomer(),
                  child: const Text("Tambah"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static dialogAddProduct() {
    final homeC = Get.put(HomeController());
    return Get.defaultDialog(
      title: "Add Product",
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Brand"),
              const SizedBox(
                height: 6,
              ),
              DropdownSearch<BrandEntity>(
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Masukkan nama brand",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                asyncItems: (String filter) =>
                    homeC.brandRemoteDataSource.getBrand(),
                itemAsString: (BrandEntity u) => u.txtBrandName,
                onChanged: (BrandEntity? data) {
                  homeC.brandId = data?.intBrandID ?? 0;
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Produk Code"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: homeC.tcProductCode,
                onChanged: (val) {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Product Name"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: homeC.tcProductName,
                // validator: (val) => Validators.requiredField(val!),
                onChanged: (val) {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => homeC.addProduct(),
                  child: const Text("Tambah"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
