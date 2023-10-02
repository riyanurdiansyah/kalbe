import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kalbe/business/entities/brand.dart';
import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/business/repositories/product_repository.dart';
import 'package:kalbe/core/exception.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/product.dart';

import '../datasources/local/product_local_data_source_impl.dart';
import '../datasources/remote/product_remote_data_source_impl.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSourceImpl productRemoteDataSource;

  final ProductLocalDataSourceImpl productLocalDataSource;

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.productLocalDataSource,
  });

  @override
  Future<Either<CustomFailure, ProductEntity>> addProduct(
      ProductModel product) async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await productRemoteDataSource.addProduct(product));
      } else {
        return const Left(CustomFailure(500, "No Internet Connection"));
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, List<ProductEntity>>> getProduct() async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await productRemoteDataSource.getProduct());
      } else {
        return Right(await productLocalDataSource.getProductsFromCache());
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, String>> addProductToCache(
      List<ProductModel> brands) async {
    try {
      return Right(await productLocalDataSource.saveProductToCache(brands));
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }
}
