import 'package:coronavirus_no_brasil/app/domain/models/commit_github_model.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

mixin ICityRemoteDataSource {
  //Future<String> getCitiesCSV();
  Future<DateTime> getLastChangeOnCSV();
}

class CityRemoteDataSource implements ICityRemoteDataSource {
  final Dio dio;

  CityRemoteDataSource({@required this.dio});

  @override
  Future<DateTime> getLastChangeOnCSV() =>
      _getLastCommitOnGitHub().then((r) => r.commit.committer.date);

  Future<CommitGitHubModel> _getLastCommitOnGitHub() async {
    final response = await dio.get(Constants.urlGitHubApi);

    if (response.statusCode != 200) throw ServerException();

    return CommitGitHubModel.fromJson(response.data[0]);
  }
}
