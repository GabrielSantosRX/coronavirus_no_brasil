import 'package:coronavirus_no_brasil/app/data/datasources/city_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';

import '../../../fixtures/fixture_reader.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  final dio = Dio();
  DioAdapterMock dioAdapterMock;
  CityRemoteDataSource dataSource;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    dataSource = CityRemoteDataSource(dio: dio);
  });

  void setUpMockHttpClientGitHubCityCSVSuccess200() {
    when(dioAdapterMock.fetch(any, any, any))
        .thenAnswer((_) async => ResponseBody.fromString(
              fixture('cases_brazil_cities.csv'),
              200,
            ));
  }

  void setUpMockHttpClientGitHubCommitSuccess200() {
    when(dioAdapterMock.fetch(any, any, any))
        .thenAnswer((_) async => ResponseBody.fromString(
              fixture('cases_brazil_cities_commit.json'),
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            ));
  }

  void setUpMockHttpClientFailure404() {
    // when(mockHttpClient.get(any, headers: anyNamed('headers')))
    //     .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  test(
    '''must execute a GET request on a GitHub API and 
         return the date of the last commit''',
    () async {
      // arrange
      setUpMockHttpClientGitHubCommitSuccess200();
      // act
      final result = await dataSource.getLastChange();
      // assert
      expect(result, equals(DateTime.parse('2020-04-08T04:13:39Z')));
    },
  );

  test(
    '''must execute a GET request on a GitHub RAW and return the Cities CSV''',
    () async {
      // arrange
      setUpMockHttpClientGitHubCityCSVSuccess200();
      // act
      final result = await dataSource.getCitiesCSV();
      // assert
      expect(result, isNotNull);
      expect(result.isNotEmpty, true);
    },
  );
}
