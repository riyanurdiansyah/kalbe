import 'package:kalbe/data/models/pembelian.dart';

abstract class PembelianLocalDataSource {
  Future<String> savePembelianToCache(List<PembelianModel> pembelians);

  Future<List<PembelianModel>> getPembeliansFromCache();
}
