import 'package:coronavirus_no_brasil/app/models/cities_collection.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  @observable
  String searchText = '';

  @observable
  List<CityModel> citiesFiltered = <CityModel>[];

  @observable
  CityModel citySelected;

  CitiesCollection citiesData;

  DashboardControllerBase() {
    reaction((_) => searchText, (String result) {
      if (null == result || result.isEmpty) {
        citiesFiltered = <CityModel>[];
        return;
      }

      print('procura: $result');
      citiesFiltered = citiesData.where((q) => q.cityQuery.startsWith(result)).toList()..sort();

      print(citiesFiltered?.length.toString());

      if (citiesFiltered?.length == 1) {
        citySelected = citiesFiltered.first;
      }
    });
  }

  @action
  setCitiesData(CitiesCollection value) => citiesData = value;
}
