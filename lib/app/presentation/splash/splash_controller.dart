import 'package:coronavirus_no_brasil/app/data/repositories/city_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final ICityRepository cityRepository;

  @observable
  String status = 'Inicializando Aplicação';

  SplashControllerBase(this.cityRepository) {
    updateData();
  }

  @action
  updateData() {
    status = 'Atualizando dados...';

    cityRepository.checkRequiredUpdate.then((update) {
      if (update) {
        status = 'Tem que atualizar a menina';
      }
    });

    status = 'Cidades Atualizadas ...';
  }
}
