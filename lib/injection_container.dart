import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:coronavirus_no_brasil/app/data/datasources/city_local_datasource.dart';
import 'package:coronavirus_no_brasil/app/data/datasources/city_remote_datasource.dart';
import 'package:coronavirus_no_brasil/app/data/repositories/city_repository.dart';
import 'package:coronavirus_no_brasil/app/presentation/splash/splash_controller.dart';
import 'package:coronavirus_no_brasil/core/connectivity.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Repository
  sl.registerLazySingleton<ICityRepository>(
    () => CityRepository(
      remoteDataSource: sl<ICityRemoteDataSource>(),
      localDataSource: sl<ICityLocalDataSource>(),
      connectivity: sl<IConnectivity>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ICityRemoteDataSource>(
    () => CityRemoteDataSource(dio: sl<Dio>()),
  );

  sl.registerLazySingleton<ICityLocalDataSource>(
    () => CityLocalDataSource(box: sl<Box>()),
  );

  //! Core
  sl.registerLazySingleton<IConnectivity>(() => Connectivity(sl()));

  //! External
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final box = await Hive.openBox(Constants.hiveBox);
  sl.registerLazySingleton(() => box);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());

  //! Features
  // Controllers
  sl.registerLazySingleton(() => SplashController(sl<ICityRepository>()));
}
