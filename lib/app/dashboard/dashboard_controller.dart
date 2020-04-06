import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  @observable
  int counter = 0;

  @action
  int increment() => counter * 2;
}
