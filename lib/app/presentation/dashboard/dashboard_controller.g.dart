// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on DashboardControllerBase, Store {
  final _$searchTextAtom = Atom(name: 'DashboardControllerBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.context.enforceReadPolicy(_$searchTextAtom);
    _$searchTextAtom.reportObserved();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.context.conditionallyRunInAction(() {
      super.searchText = value;
      _$searchTextAtom.reportChanged();
    }, _$searchTextAtom, name: '${_$searchTextAtom.name}_set');
  }

  final _$citiesFilteredAtom =
      Atom(name: 'DashboardControllerBase.citiesFiltered');

  @override
  List<CityModel> get citiesFiltered {
    _$citiesFilteredAtom.context.enforceReadPolicy(_$citiesFilteredAtom);
    _$citiesFilteredAtom.reportObserved();
    return super.citiesFiltered;
  }

  @override
  set citiesFiltered(List<CityModel> value) {
    _$citiesFilteredAtom.context.conditionallyRunInAction(() {
      super.citiesFiltered = value;
      _$citiesFilteredAtom.reportChanged();
    }, _$citiesFilteredAtom, name: '${_$citiesFilteredAtom.name}_set');
  }

  final _$citySelectedAtom = Atom(name: 'DashboardControllerBase.citySelected');

  @override
  CityModel get citySelected {
    _$citySelectedAtom.context.enforceReadPolicy(_$citySelectedAtom);
    _$citySelectedAtom.reportObserved();
    return super.citySelected;
  }

  @override
  set citySelected(CityModel value) {
    _$citySelectedAtom.context.conditionallyRunInAction(() {
      super.citySelected = value;
      _$citySelectedAtom.reportChanged();
    }, _$citySelectedAtom, name: '${_$citySelectedAtom.name}_set');
  }

  final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase');

  @override
  dynamic setCitiesData(CitiesCollection value) {
    final _$actionInfo =
        _$DashboardControllerBaseActionController.startAction();
    try {
      return super.setCitiesData(value);
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'searchText: ${searchText.toString()},citiesFiltered: ${citiesFiltered.toString()},citySelected: ${citySelected.toString()}';
    return '{$string}';
  }
}
