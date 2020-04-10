import 'package:hive/hive.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:meta/meta.dart';

abstract class ICityLocalDataSource {
  String getCitiesCSV();
  DateTime getLastUpdate();
  Future cacheLastUpdate(DateTime update);
  Future cacheCitiesCSV(String csvRaw);
}

class CityLocalDataSource implements ICityLocalDataSource {
  final Box box;

  CityLocalDataSource({@required this.box});

  @override
  DateTime getLastUpdate() => box.get(Constants.cachedCitiesLastUpdate);

  @override
  Future cacheLastUpdate(DateTime update) async =>
      box.put(Constants.cachedCitiesLastUpdate, update);

  @override
  Future cacheCitiesCSV(String csvRaw) async =>
      box.put(Constants.cachedCitiesCSV, csvRaw);

  @override
  String getCitiesCSV() => box.get(Constants.cachedCitiesCSV);
}
