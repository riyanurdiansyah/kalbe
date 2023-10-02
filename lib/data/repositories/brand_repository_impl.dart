import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kalbe/business/entities/brand.dart';
import 'package:dartz/dartz.dart';
import 'package:kalbe/business/repositories/brand_repository.dart';
import 'package:kalbe/core/exception.dart';
import 'package:kalbe/data/datasources/local/brand_local_data_source.dart';
import 'package:kalbe/data/datasources/remote/brand_remote_data_source.dart';
import 'package:kalbe/data/models/brand.dart';
import 'package:kalbe/core/faiures.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandRemoteDataSource brandRemoteDataSource;

  final BrandLocalDataSource brandLocalDataSource;

  BrandRepositoryImpl({
    required this.brandRemoteDataSource,
    required this.brandLocalDataSource,
  });

  @override
  Future<Either<CustomFailure, BrandEntity>> addBrand(
      Map<String, dynamic> brand) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Right(await brandRemoteDataSource.addBrand(brand));
      } else {
        return const Left(CustomFailure(500, "No Internet Connection"));
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, List<BrandEntity>>> getBrand() async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await brandRemoteDataSource.getBrand());
      } else {
        return Right(await brandLocalDataSource.getBrandsFromCache());
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, String>> addBrandToCache(
      List<BrandModel> brands) async {
    try {
      return Right(await brandLocalDataSource.saveBrandToCache(brands));
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }
}
