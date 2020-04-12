import 'package:coronavirus_no_brasil/app/data/repositories/city_repository.dart';
import 'package:coronavirus_no_brasil/app/models/city_cases_model.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:mobx/mobx.dart';

part 'city_controller.g.dart';

class CityController = CityControllerBase with _$CityController;

abstract class CityControllerBase with Store {
  final ICityRepository cityRepository;

  @observable
  bool isLoading = true;

  @observable
  CityModel city;

  @observable
  CityCasesModel cityCases = CityCasesModel();

  CityControllerBase(this.cityRepository);

  @action
  setCitySelected(CityModel citySelected) async {
    isLoading = true;
    city = citySelected;
    cityCases = await cityRepository.getCityCases(city.ibgeID);
    cityCases.covidCases.sort();
    isLoading = false;
  }
}
