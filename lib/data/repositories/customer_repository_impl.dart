import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/customer.dart';
import 'package:kalbe/core/exception.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/customer.dart';

import '../../business/repositories/customer_repository.dart';
import '../datasources/local/customer_local_data_source.dart';
import '../datasources/remote/customer_remote_data_source.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource customerRemoteDataSource;

  final CustomerLocalDataSource customerLocalDataSource;

  CustomerRepositoryImpl({
    required this.customerRemoteDataSource,
    required this.customerLocalDataSource,
  });

  @override
  Future<Either<CustomFailure, bool>> addCustomer(
      Map<String, dynamic> customer) async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await customerRemoteDataSource.addCustomer(customer));
      } else {
        return const Left(CustomFailure(500, "No Internet Connection"));
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, String>> addCustomerToCache(
      List<CustomerModel> customer) async {
    try {
      return Right(await customerLocalDataSource.saveCustomerToCache(customer));
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  @override
  Future<Either<CustomFailure, List<CustomerEntity>>> getCustomer() async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        return Right(await customerRemoteDataSource.getCustomer());
      } else {
        return Right(await customerLocalDataSource.getCustomersFromCache());
      }
    } on CustomException catch (e) {
      return Left(CustomFailure(e.code, e.message));
    }
  }

  // @override
  // Future<Either<CustomFailure, List<CustomerEntity>>> getCustomer() async {
  //   try {
  //     bool hasConnection = await InternetConnectionChecker().hasConnection;
  //     if (hasConnection) {
  //       return Right(await customerRemoteDataSource.getCustomer());
  //     } else {
  //       return Right(await customerLocalDataSource.getCustomersFromCache());
  //     }
  //   } on CustomException catch (e) {
  //     return Left(CustomFailure(e.code, e.message));
  //   }
  // }

  // @override
  // Future<Either<CustomFailure, String>> addCustomerToCache(
  //     List<CustomerModel> customer) async {
  //   try {
  //     return Right(await customerLocalDataSource.saveCustomerToCache(customer));
  //   } on CustomException catch (e) {
  //     return Left(CustomFailure(e.code, e.message));
  //   }
  // }

  // @override
  // Future<Either<CustomFailure, CustomerEntity>> addCustomer(
  //     CustomerModel customer) async {
  //   try {
  //     bool hasConnection = await InternetConnectionChecker().hasConnection;
  //     if (hasConnection) {
  //       return Right(await customerRemoteDataSource.addCustomer(customer));
  //     } else {
  //       return const Left(CustomFailure(500, "No Internet Connection"));
  //     }
  //   } on CustomException catch (e) {
  //     return Left(CustomFailure(e.code, e.message));
  //   }
  // }
}
