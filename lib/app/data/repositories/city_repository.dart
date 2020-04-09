import 'package:coronavirus_no_brasil/app/data/datasources/city_local_datasource.dart';
import 'package:coronavirus_no_brasil/app/data/datasources/city_remote_datasource.dart';
import 'package:coronavirus_no_brasil/app/domain/models/city.dart';
import 'package:coronavirus_no_brasil/core/connectivity.dart';
import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';

import 'package:meta/meta.dart';

mixin ICityRepository {
  Future<bool> get checkRequiredUpdate;

  Future<List<CityModel>> getCitiesUpdated();
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
    final lastUpdate = localDataSource.getLastUpdate();
    final lastChange = await remoteDataSource.getLastChange();

    return null == lastUpdate || lastUpdate.isBefore(lastChange);
  }

  @override
  Future<List<CityModel>> getCitiesUpdated() async {
    final isConnected = await connectivity.isConnected;
    final isRequiredUpdate = isConnected ? await checkRequiredUpdate : false;

    String csvRaw;
    if (isConnected && isRequiredUpdate) {
      csvRaw = await remoteDataSource.getCitiesCSV();
      await localDataSource.cacheCitiesCSV(csvRaw);
    } else {
      csvRaw = await localDataSource.getCitiesCSV();
    }

    final rows = const CsvToListConverter().convert(
      csvRaw,
      csvSettingsDetector: const FirstOccurrenceSettingsDetector(
        eols: ['\r\n', '\n'],
        textDelimiters: ['"', "'"],
      ),
      shouldParseNumbers: true,
    );

    rows.removeAt(0); // remove titles

    return rows.map((r) => CityModel.fromCSV(r)).toList();
  }
}
