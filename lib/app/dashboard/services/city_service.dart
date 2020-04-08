import 'package:coronavirus_no_brasil/app/dashboard/repositories/city_repository.dart';

mixin ICityService {
  Future<bool> checkLastChangeOnCSV();
}

class CityService implements ICityService {
  final ICityRepository repository;

  CityService(this.repository);

  @override
  Future<bool> checkLastChangeOnCSV() async {
    return await true;
  }
}
