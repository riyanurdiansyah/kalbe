import 'package:kalbe/data/models/pembelian.dart';

abstract class PembelianRemoteDataSource {
  Future<List<PembelianModel>> getPembelian();

  Future<bool> addPembelian(Map<String, dynamic> pembelian);
}
