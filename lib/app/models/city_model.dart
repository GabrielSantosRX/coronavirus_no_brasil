import 'package:diacritic/diacritic.dart' as dic;

class CityModel implements Comparable<CityModel> {
  String country;
  String state;
  String city;
  String cityQuery;
  int ibgeID;
  int deaths;
  int totalCases;

  CityModel({this.country, this.state, this.city, this.cityQuery, this.ibgeID, this.deaths, this.totalCases});

  factory CityModel.fromCSV(List<dynamic> row) {
    final city = row[2].toString().substring(0, row[2].toString().indexOf('/')); // remove state ex:'/DF'

    return CityModel(
      country: row[0],
      state: row[1],
      city: city,
      cityQuery: dic.removeDiacritics(city.toLowerCase()), // remove accents for querying
      ibgeID: row[3],
      deaths: row[4],
      totalCases: row[5],
    );
  }

  @override
  String toString() => '$state $city $ibgeID';

  @override
  int compareTo(CityModel other) => cityQuery.compareTo(other.cityQuery);
}
