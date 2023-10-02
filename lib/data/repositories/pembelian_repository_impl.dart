import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/pembelian.dart';
import 'package:kalbe/business/repositories/pembelian_repository.dart';
import 'package:kalbe/core/exception.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/pembelian.dart';

import '../datasources/local/pembelian_local_data_source_impl.dart';
import '../datasources/remote/pembelian_remote_data_source_impl.dart';

class PembelianRepositoryImpl implements PembelianRepository {
  final PembelianRemoteDataSourceImpl pembelianRemoteDataSource;

  final PembelianLocalDataSourceImpl pembelianLocalDataSource;

  PembelianRepositoryImpl({
    required this.pembelianRemoteDataSource,
    required this.pembelianLocalDataSource,
  });

  @override
  Future<Either<CustomFailure, bool>> addPembelian(
      Map<String, dynamic> pembelian) async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await pembelianRemoteDataSource.addPembelian(pembelian));
      } else {
        return const Left(CustomFailure(500, "No Internet Connection"));
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, List<PembelianEntity>>> getPembelian() async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await pembelianRemoteDataSource.getPembelian());
      } else {
        return Right(await pembelianLocalDataSource.getPembeliansFromCache());
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, String>> addPembelianToCache(
      List<PembelianModel> brands) async {
    try {
      return Right(await pembelianLocalDataSource.savePembelianToCache(brands));
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }
}
