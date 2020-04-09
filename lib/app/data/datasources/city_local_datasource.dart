import 'package:coronavirus_no_brasil/core/exceptions.dart';
import 'package:hive/hive.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:meta/meta.dart';

abstract class ICityLocalDataSource {
  //Future<String> getCitiesCSV();
  DateTime getLastUpdate();
  Future cacheLastUpdate(DateTime update);
}

class CityLocalDataSource implements ICityLocalDataSource {
  final Box box;

  CityLocalDataSource({@required this.box});

  @override
  DateTime getLastUpdate() {
    final result = box.get(Constants.cachedCitiesLastUpdate);

    return result;
  }

  @override
  Future cacheLastUpdate(DateTime update) =>
      box.put(Constants.cachedCitiesLastUpdate, update);
}
