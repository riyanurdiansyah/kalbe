import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/brand.dart';
import 'package:kalbe/data/models/brand.dart';

import '../../core/faiures.dart';

abstract class BrandRepository {
  Future<Either<CustomFailure, List<BrandEntity>>> getBrand();

  Future<Either<CustomFailure, BrandEntity>> addBrand(BrandModel brand);

  Future<Either<CustomFailure, String>> addBrandToCache(List<BrandModel> brand);
}
