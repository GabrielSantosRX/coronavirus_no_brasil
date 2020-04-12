import 'package:coronavirus_no_brasil/app/data/repositories/city_repository.dart';
import 'package:coronavirus_no_brasil/app/models/cities_collection.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final ICityRepository cityRepository;

  @observable
  bool isDataLoaded = false;

  @observable
  String status = 'Inicializando';

  CitiesCollection citiesList;

  SplashControllerBase(this.cityRepository) {
    _updateData();
  }

  @action
  Future<void> _updateData() async {
    status = 'Atualizando dados...';
    citiesList = await cityRepository.getCitiesUpdated();
    status = 'Dados Atualizados!';
    isDataLoaded = true;
  }
}
