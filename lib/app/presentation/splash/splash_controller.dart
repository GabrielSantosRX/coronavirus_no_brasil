import 'package:coronavirus_no_brasil/app/data/repositories/city_repository.dart';
import 'package:coronavirus_no_brasil/app/domain/models/city.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final ICityRepository cityRepository;

  @observable
  bool isDataLoaded = false;

  List<CityModel> cities = <CityModel>[];

  SplashControllerBase(this.cityRepository) {
    _updateData();
  }

  @action
  Future<void> _updateData() async {
    cities = await cityRepository.getCitiesUpdated();
    isDataLoaded = true;
  }
}
