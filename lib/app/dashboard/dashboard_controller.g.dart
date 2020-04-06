// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on DashboardControllerBase, Store {
  final _$counterAtom = Atom(name: 'DashboardControllerBase.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase');

  @override
  int increment() {
    final _$actionInfo =
        _$DashboardControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'counter: ${counter.toString()}';
    return '{$string}';
  }
}
