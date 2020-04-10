class CityModel {
  String country;
  String state;
  String city;
  int ibgeID;
  int deaths;
  int totalCases;

  CityModel(
      {this.country,
      this.state,
      this.city,
      this.ibgeID,
      this.deaths,
      this.totalCases});

  factory CityModel.fromCSV(List<dynamic> row) => CityModel(
        country: row[0],
        state: row[1],
        city: row[2],
        ibgeID: row[3],
        deaths: row[4],
        totalCases: row[5],
      );
}
