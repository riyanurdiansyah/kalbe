import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalbe/business/entities/brand.dart';
import 'package:kalbe/business/entities/customer.dart';
import 'package:kalbe/business/entities/pembelian.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/business/usecases/brand_usecase.dart';
import 'package:kalbe/business/usecases/pembelian_usecase.dart';
import 'package:kalbe/business/usecases/product_usecase.dart';
import 'package:kalbe/business/usecases/customer_usecase.dart';
import 'package:kalbe/data/datasources/local/brand_local_data_source_impl.dart';
import 'package:kalbe/data/datasources/local/product_local_data_source_impl.dart';
import 'package:kalbe/data/datasources/remote/brand_remote_data_source_impl.dart';
import 'package:kalbe/data/datasources/remote/product_remote_data_source_impl.dart';
import 'package:kalbe/data/repositories/brand_repository_impl.dart';
import 'package:kalbe/data/repositories/customer_repository_impl.dart';
import 'package:kalbe/data/repositories/product_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kalbe/data/datasources/local/customer_local_data_source_impl.dart';
import 'package:kalbe/data/datasources/remote/customer_remote_data_source_impl.dart';

import '../../data/datasources/local/pembelian_local_data_source_impl.dart';
import '../../data/datasources/remote/pembelian_remote_data_source_impl.dart';
import '../../data/repositories/pembelian_repository_impl.dart';

class HomeController extends GetxController {
  late BrandRepositoryImpl brandRepository;
  late BrandRemoteDataSourceImpl brandRemoteDataSource;
  late BrandLocalDataSourceImpl brandLocalDataSource;

  late ProductRepositoryImpl productRepository;
  late ProductRemoteDataSourceImpl productRemoteDataSource;
  late ProductLocalDataSourceImpl productLocalDataSource;

  late CustomerRepositoryImpl customerRepository;
  late CustomerRemoteDataSourceImpl customerRemoteDataSource;
  late CustomerLocalDataSourceImpl customerLocalDataSource;

  late PembelianRepositoryImpl pembelianRepository;
  late PembelianRemoteDataSourceImpl pembelianRemoteDataSource;
  late PembelianLocalDataSourceImpl pembelianLocalDataSource;

  final RxInt _indexTab = 0.obs;
  RxInt get indexTab => _indexTab;

  final RxInt _bitGender = 99.obs;
  RxInt get bitGender => _bitGender;

  final RxList<BrandEntity> _brands = <BrandEntity>[].obs;
  RxList<BrandEntity> get brands => _brands;

  final RxList<ProductEntity> _products = <ProductEntity>[].obs;
  RxList<ProductEntity> get products => _products;

  final RxList<CustomerEntity> _customers = <CustomerEntity>[].obs;
  RxList<CustomerEntity> get customers => _customers;

  final RxList<PembelianEntity> _pembelians = <PembelianEntity>[].obs;
  RxList<PembelianEntity> get pembelians => _pembelians;

  final TextEditingController tcNamaBrand = TextEditingController();
  final TextEditingController tcNamaCustomer = TextEditingController();
  final TextEditingController tcAlamatCustomer = TextEditingController();
  final TextEditingController tcProductCode = TextEditingController();
  final TextEditingController tcProductName = TextEditingController();

  int customerId = 0;
  String customerName = "";
  int productId = 0;
  int qty = 0;
  int brandId = 0;

  @override
  void onInit() async {
    await initialize();
    getCustomer();
    getProducts();
    getBrands();
    getPembelian();
    super.onInit();
  }

  Future<void> initialize() async {
    brandRemoteDataSource = BrandRemoteDataSourceImpl();
    brandLocalDataSource = BrandLocalDataSourceImpl(
      prefs: await SharedPreferences.getInstance(),
    );
    brandRepository = BrandRepositoryImpl(
      brandRemoteDataSource: brandRemoteDataSource,
      brandLocalDataSource: brandLocalDataSource,
    );

    productRemoteDataSource = ProductRemoteDataSourceImpl();
    productLocalDataSource = ProductLocalDataSourceImpl(
      prefs: await SharedPreferences.getInstance(),
    );
    productRepository = ProductRepositoryImpl(
      productRemoteDataSource: productRemoteDataSource,
      productLocalDataSource: productLocalDataSource,
    );

    customerRemoteDataSource = CustomerRemoteDataSourceImpl();
    customerLocalDataSource = CustomerLocalDataSourceImpl(
      prefs: await SharedPreferences.getInstance(),
    );
    customerRepository = CustomerRepositoryImpl(
      customerRemoteDataSource: customerRemoteDataSource,
      customerLocalDataSource: customerLocalDataSource,
    );

    pembelianRemoteDataSource = PembelianRemoteDataSourceImpl();
    pembelianLocalDataSource = PembelianLocalDataSourceImpl(
      prefs: await SharedPreferences.getInstance(),
    );
    pembelianRepository = PembelianRepositoryImpl(
      pembelianRemoteDataSource: pembelianRemoteDataSource,
      pembelianLocalDataSource: pembelianLocalDataSource,
    );
  }

  void onTapMenu(int value) {
    _indexTab.value = value;
  }

  Future getBrands() async {
    final response = await GetBrand(brandRepository).call();
    response.fold((fail) => log(fail.message), (data) {
      AddBrandToCache(brandRepository).call(data);
      _brands.value = data;
    });
  }

  Future getProducts() async {
    final response = await GetProduct(productRepository).call();
    response.fold((fail) => log(fail.message), (data) {
      AddProductToCache(productRepository).call(data);
      _products.value = data;
    });
  }

  Future getCustomer() async {
    final response = await GetCustomer(customerRepository).call();
    response.fold((fail) => log(fail.message), (data) {
      AddCustomerToCache(customerRepository).call(data);
      _customers.value = data;
    });
  }

  Future getPembelian() async {
    final response = await GetPembelian(pembelianRepository).call();
    response.fold((fail) => log(fail.message), (data) {
      AddPembelianToCache(pembelianRepository).call(data);
      _pembelians.value = data;
    });
  }

  Future addPembelian() async {
    Get.back();
    final bodyPembelian = {
      "intCustomerID": customerId,
      "intProductID": productId,
      "intQty": qty,
    };

    final response =
        await AddPembelian(pembelianRepository).call(bodyPembelian);
    response.fold((fail) => log(fail.message), (data) {
      getPembelian();
    });
  }

  Future addBrand() async {
    Get.back();
    final bodyBrand = {
      "txtBrandName": tcNamaBrand.text,
    };

    final response = await AddBrand(brandRepository).call(bodyBrand);
    response.fold((fail) => log(fail.message), (data) {
      getBrands();
    });
  }

  Future addCustomer() async {
    Get.back();
    final bodyCustomer = {
      "txtCustomerName": tcNamaCustomer.text,
      "txtCustomerAddress": tcAlamatCustomer.text,
      "bitGender": _bitGender.value
    };

    final response = await AddCustomer(customerRepository).call(bodyCustomer);
    response.fold((fail) => log(fail.message), (data) {
      getCustomer();
    });
  }

  Future addProduct() async {
    Get.back();
    final bodyProduct = {
      "txtProductCode": tcProductCode.text,
      "txtProductName": tcProductName.text,
      "intBrandID": brandId,
    };

    final response = await AddProduct(productRepository).call(bodyProduct);
    response.fold((fail) => log(fail.message), (data) {
      getProducts();
    });
  }
}
