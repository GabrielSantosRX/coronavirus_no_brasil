// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on SplashControllerBase, Store {
  final _$isDataLoadedAtom = Atom(name: 'SplashControllerBase.isDataLoaded');

  @override
  bool get isDataLoaded {
    _$isDataLoadedAtom.context.enforceReadPolicy(_$isDataLoadedAtom);
    _$isDataLoadedAtom.reportObserved();
    return super.isDataLoaded;
  }

  @override
  set isDataLoaded(bool value) {
    _$isDataLoadedAtom.context.conditionallyRunInAction(() {
      super.isDataLoaded = value;
      _$isDataLoadedAtom.reportChanged();
    }, _$isDataLoadedAtom, name: '${_$isDataLoadedAtom.name}_set');
  }

  final _$_updateDataAsyncAction = AsyncAction('_updateData');

  @override
  Future<void> _updateData() {
    return _$_updateDataAsyncAction.run(() => super._updateData());
  }

  @override
  String toString() {
    final string = 'isDataLoaded: ${isDataLoaded.toString()}';
    return '{$string}';
  }
}
