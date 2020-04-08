import 'package:coronavirus_no_brasil/app/dashboard/datasources/city_local_datasource.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/exceptions.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';

class MockBox extends Mock implements Box {}

void main() {
  CityLocalDataSource dataSource;
  MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = CityLocalDataSource(
      box: mockBox,
    );
  });

  group('getLastChangeOnCSV', () {
    test(
      'should return DateTime of Last Change from Box when there is one in the cache',
      () async {
        // arrange
        final mockLastDate = DateTime.now();
        when(mockBox.get(any)).thenReturn(mockLastDate);
        // act
        final result = await dataSource.getLastChangeOnCSV();
        // assert
        verify(mockBox.get(Constants.cachedLastChange));
        expect(result, equals(mockLastDate));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockBox.get(any)).thenReturn(null);
        // act
        final call = dataSource.getLastChangeOnCSV;
        // assert
        expect(() => call(), throwsA(TypeMatcher<CacheException>()));
      },
    );
  });
}
