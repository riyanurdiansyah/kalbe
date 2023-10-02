import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/brand.dart';
import 'package:kalbe/business/repositories/brand_repository.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/brand.dart';

class GetBrand {
  final BrandRepository repository;

  GetBrand(this.repository);

  Future<Either<CustomFailure, List<BrandEntity>>> call() async {
    return await repository.getBrand();
  }
}

class AddBrand {
  final BrandRepository repository;

  AddBrand(this.repository);

  Future<Either<CustomFailure, BrandEntity>> call(BrandModel brand) async {
    return await repository.addBrand(brand);
  }
}

class AddBrandToCache {
  final BrandRepository repository;

  AddBrandToCache(this.repository);

  Future<Either<CustomFailure, String>> call(List<BrandEntity> brands) async {
    List<BrandModel> brandsModel = [];
    for (var data in brands) {
      brandsModel.add(BrandEntity.toBrandModel(data));
    }
    return await repository.addBrandToCache(brandsModel);
  }
}
