import 'package:coronavirus_no_brasil/app/data/datasources/city_local_datasource.dart';
import 'package:coronavirus_no_brasil/app/data/datasources/city_remote_datasource.dart';
import 'package:coronavirus_no_brasil/app/models/cities_collection.dart';
import 'package:coronavirus_no_brasil/app/models/city_cases_model.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/core/connectivity.dart';
import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';

import 'package:meta/meta.dart';

mixin ICityRepository {
  Future<bool> get checkRequiredUpdate;

  Future<CitiesCollection> getCitiesUpdated();
  Future<CityCasesModel> getCityCases(int ibgeID);
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
    print('Last Update: $lastUpdate');
    return null == lastUpdate || lastUpdate.isBefore(lastChange);
  }

  @override
  Future<CitiesCollection> getCitiesUpdated() async {
    final isConnected = await connectivity.isConnected;
    final isRequiredUpdate = isConnected ? await checkRequiredUpdate : false;

    String csvRaw;
    if (isConnected && isRequiredUpdate) {
      print('is online');
      csvRaw = await remoteDataSource.getCitiesCSV();
      await localDataSource.cacheCitiesCSV(csvRaw);
      await localDataSource.cacheLastUpdate(DateTime.now());
    } else {
      print('is cached');
      csvRaw = localDataSource.getCitiesCSV();
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

    return CitiesCollection(
      lastUpdate: localDataSource.getLastUpdate(),
      innerList: rows.map((r) => CityModel.fromCSV(r)).toList(),
    );
  }

  @override
  Future<CityCasesModel> getCityCases(int ibgeID) async {
    print('getCityCases $ibgeID');

    final isConnected = await connectivity.isConnected;
    if (!isConnected) return null;

    final jsonRaw = await remoteDataSource.getCityCases(ibgeID);

    if (null == jsonRaw || jsonRaw.isEmpty) return null;

    return CityCasesModel.fromRawJson(jsonRaw);
  }
}
