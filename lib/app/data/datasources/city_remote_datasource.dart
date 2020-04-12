import 'package:coronavirus_no_brasil/app/models/commit_github_model.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

mixin ICityRemoteDataSource {
  Future<String> getCitiesCSV();
  Future<DateTime> getLastChange();
  Future<String> getCityCases(int ibgeID);
}

class CityRemoteDataSource implements ICityRemoteDataSource {
  final Dio dio;

  CityRemoteDataSource({@required this.dio});

  @override
  Future<DateTime> getLastChange() => _getLastCommitOnGitHub().then((r) => r.commit.committer.date);

  Future<CommitGitHubModel> _getLastCommitOnGitHub() async {
    final response = await dio.get(Constants.urlGitHubApi);

    if (response.statusCode != 200) throw ServerException();

    return CommitGitHubModel.fromJson(response.data[0]);
  }

  @override
  Future<String> getCitiesCSV() async {
    final response = await dio.get(Constants.urlGitHubCitiesCSV);

    if (response.statusCode != 200) throw ServerException();

    return response.data;
  }

  @override
  Future<String> getCityCases(int ibgeID) async {
    Response<String> response;
    response = await dio.get(
      Constants.urlBrasilioCityCasesAPI,
      options: Options(responseType: ResponseType.json),
      queryParameters: {'city_ibge_code': ibgeID},
      //queryParameters: {'is_last': 'True', 'city_ibge_code': ibgeID},
    );

    if (response.statusCode != 200) throw ServerException();

    return response.data;
  }
}
