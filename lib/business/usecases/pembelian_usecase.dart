import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/pembelian.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/business/repositories/pembelian_repository.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/product.dart';

import '../../data/models/pembelian.dart';

class GetPembelian {
  final PembelianRepository repository;

  GetPembelian(this.repository);

  Future<Either<CustomFailure, List<PembelianEntity>>> call() async {
    return await repository.getPembelian();
  }
}

class AddPembelian {
  final PembelianRepository repository;

  AddPembelian(this.repository);

  Future<Either<CustomFailure, bool>> call(
      Map<String, dynamic> pembelian) async {
    return await repository.addPembelian(pembelian);
  }
}

class AddPembelianToCache {
  final PembelianRepository repository;

  AddPembelianToCache(this.repository);

  Future<Either<CustomFailure, String>> call(
      List<PembelianEntity> products) async {
    List<PembelianModel> productsModel = [];
    for (var data in products) {
      productsModel.add(PembelianEntity.toPembelianModel(data));
    }
    return await repository.addPembelianToCache(productsModel);
  }
}
