import 'package:coronavirus_no_brasil/app/presentation/city/city_controller.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_controller.dart';
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

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Repository
  getIt.registerLazySingleton<ICityRepository>(
    () => CityRepository(
      remoteDataSource: getIt<ICityRemoteDataSource>(),
      localDataSource: getIt<ICityLocalDataSource>(),
      connectivity: getIt<IConnectivity>(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<ICityRemoteDataSource>(
    () => CityRemoteDataSource(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<ICityLocalDataSource>(
    () => CityLocalDataSource(box: getIt<Box>()),
  );

  //! Core
  getIt.registerLazySingleton<IConnectivity>(() => Connectivity(getIt()));

  //! External
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final box = await Hive.openBox(Constants.hiveBox);
  getIt.registerLazySingleton(() => box);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DataConnectionChecker());

  //! Features
  // Controllers
  getIt.registerLazySingleton(() => SplashController(getIt<ICityRepository>()));
  getIt.registerLazySingleton(() => DashboardController());
  getIt.registerLazySingleton(() => CityController(getIt<ICityRepository>()));
}
