// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityController on CityControllerBase, Store {
  final _$isLoadingAtom = Atom(name: 'CityControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$cityAtom = Atom(name: 'CityControllerBase.city');

  @override
  CityModel get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(CityModel value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$cityCasesAtom = Atom(name: 'CityControllerBase.cityCases');

  @override
  CityCasesModel get cityCases {
    _$cityCasesAtom.context.enforceReadPolicy(_$cityCasesAtom);
    _$cityCasesAtom.reportObserved();
    return super.cityCases;
  }

  @override
  set cityCases(CityCasesModel value) {
    _$cityCasesAtom.context.conditionallyRunInAction(() {
      super.cityCases = value;
      _$cityCasesAtom.reportChanged();
    }, _$cityCasesAtom, name: '${_$cityCasesAtom.name}_set');
  }

  final _$setCitySelectedAsyncAction = AsyncAction('setCitySelected');

  @override
  Future setCitySelected(CityModel citySelected) {
    return _$setCitySelectedAsyncAction
        .run(() => super.setCitySelected(citySelected));
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},city: ${city.toString()},cityCases: ${cityCases.toString()}';
    return '{$string}';
  }
}
