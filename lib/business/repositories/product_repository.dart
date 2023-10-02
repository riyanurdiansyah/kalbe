import 'package:dartz/dartz.dart';
import 'package:kalbe/business/entities/product.dart';
import 'package:kalbe/data/models/product.dart';

import '../../core/faiures.dart';

abstract class ProductRepository {
  Future<Either<CustomFailure, List<ProductEntity>>> getProduct();

  Future<Either<CustomFailure, bool>> addProduct(Map<String, dynamic> product);

  Future<Either<CustomFailure, String>> addProductToCache(
      List<ProductModel> product);
}
