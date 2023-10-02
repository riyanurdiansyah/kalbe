import 'package:kalbe/core/exception.dart';
import 'package:kalbe/data/models/pembelian.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pembelian_local_data_source.dart';

class PembelianLocalDataSourceImpl implements PembelianLocalDataSource {
  final SharedPreferences prefs;

  PembelianLocalDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<List<PembelianModel>> getPembeliansFromCache() async {
    final jsonString = prefs.getString("CACHED_PEMBELIAN");

    if (jsonString != null) {
      return PembelianModel.decode(jsonString);
    }

    throw CustomException(404, "CACHED_PEMBELIAN is not found");
  }

  @override
  Future<String> savePembelianToCache(List<PembelianModel> pembelians) {
    final encodedData = PembelianModel.encode(pembelians);
    prefs.setString("CACHED_PEMBELIAN", encodedData);

    return Future.value(encodedData);
  }
}
