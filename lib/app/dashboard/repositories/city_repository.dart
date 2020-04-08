import 'package:coronavirus_no_brasil/app/dashboard/datasources/city_local_datasource.dart';
import 'package:coronavirus_no_brasil/app/dashboard/datasources/city_remote_datasource.dart';
import 'package:coronavirus_no_brasil/core/connectivity.dart';
import 'package:coronavirus_no_brasil/core/exceptions.dart';
import 'package:dartz/dartz.dart';

mixin ICityRepository {
  Future<DateTime> checkLastChangeOnCSV();
}

class CityRepository implements ICityRepository {
  final CityRemoteDataSource remoteDataSource;
  final CityLocalDataSource localDataSource;
  final Connectivity connectivity;

  CityRepository(
      this.remoteDataSource, this.localDataSource, this.connectivity);

  @override
  Future<DateTime> checkLastChangeOnCSV() {
    // TODO: implement checkLastChangeOnCSV
    return null;
  }

  Future<Either<Failure, DateTime>> _getLastChangeOnCSV() async {
    if (await connectivity.isConnected) {
      try {
        final lastChange = await remoteDataSource.getLastChangeOnCSV();
        await localDataSource.cacheLastChangeOnCSV(lastChange);
        return Right(lastChange);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = localDataSource.getLastChangeOnCSV();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
