import 'package:coronavirus_no_brasil/app/data/datasources/city_local_datasource.dart';
import 'package:coronavirus_no_brasil/app/data/datasources/city_remote_datasource.dart';
import 'package:coronavirus_no_brasil/core/connectivity.dart';

import 'package:meta/meta.dart';

mixin ICityRepository {
  Future<bool> get checkRequiredUpdate;
}

class CityRepository implements ICityRepository {
  final CityRemoteDataSource remoteDataSource;
  final CityLocalDataSource localDataSource;
  final Connectivity connectivity;

  CityRepository(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.connectivity});

  @override
  Future<bool> get checkRequiredUpdate async {
    final isConnected = await connectivity.isConnected;
    if (!isConnected) return false;

    final lastUpdate = localDataSource.getLastUpdate();
    final lastChange = await remoteDataSource.getLastChangeOnCSV();

    return null == lastUpdate || lastUpdate.isBefore(lastChange);
  }
}
