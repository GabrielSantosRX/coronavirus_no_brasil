import 'dart:collection';

import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:flutter/material.dart';

class CitiesCollection extends ListBase<CityModel> {
  final List<CityModel> innerList;
  final DateTime lastUpdate;

  CitiesCollection({@required this.innerList, @required this.lastUpdate});

  @override
  int get length => innerList.length;

  @override
  set length(int length) {
    innerList.length = length;
  }

  @override
  CityModel operator [](int index) => innerList[index];

  @override
  void operator []=(int index, CityModel value) {
    innerList[index] = value;
  }
}
