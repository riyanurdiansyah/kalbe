import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/business/repositories/product_repository.dart';
import 'package:kalbe/core/faiures.dart';
import 'package:kalbe/data/models/product.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<CustomFailure, List<ProductEntity>>> call() async {
    return await repository.getProduct();
  }
}

class AddBrand {
  final ProductRepository repository;

  AddBrand(this.repository);

  Future<Either<CustomFailure, ProductEntity>> call(ProductModel brand) async {
    return await repository.addProduct(brand);
  }
}

class AddProductToCache {
  final ProductRepository repository;

  AddProductToCache(this.repository);

  Future<Either<CustomFailure, String>> call(
      List<ProductEntity> products) async {
    List<ProductModel> productsModel = [];
    for (var data in products) {
      productsModel.add(ProductEntity.toProductModel(data));
    }
    return await repository.addProductToCache(productsModel);
  }
}
