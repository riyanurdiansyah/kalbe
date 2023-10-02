import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/pembelian.dart';
import 'package:kalbe/data/models/pembelian.dart';

import '../../core/faiures.dart';

abstract class PembelianRepository {
  Future<Either<CustomFailure, List<PembelianEntity>>> getPembelian();

  Future<Either<CustomFailure, bool>> addPembelian(
      Map<String, dynamic> pembelian);

  Future<Either<CustomFailure, String>> addPembelianToCache(
      List<PembelianModel> pembelian);
}
