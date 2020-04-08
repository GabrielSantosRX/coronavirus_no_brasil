import 'dart:io';

import 'package:coronavirus_no_brasil/core/exceptions.dart';
import 'package:hive/hive.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:meta/meta.dart';

abstract class ICityLocalDataSource {
  Future<String> getCitiesCSV();
  DateTime getLastChangeOnCSV();
  Future cacheLastChangeOnCSV(DateTime lastChange);
}

class CityLocalDataSource implements ICityLocalDataSource {
  final Box box;

  CityLocalDataSource({@required this.box});

  @override
  Future<String> getCitiesCSV() async {
    return await '';
  }

  @override
  DateTime getLastChangeOnCSV() {
    final result = box.get(Constants.cachedLastChange);

    if (result == null) throw CacheException();

    return result;
  }

  @override
  Future cacheLastChangeOnCSV(DateTime lastChange) =>
      box.put(Constants.cachedLastChange, lastChange);
}
