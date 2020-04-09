import 'package:equatable/equatable.dart';

class CityModel implements Equatable {
  String country;
  String state;
  String city;
  int ibgeID;
  int deaths;
  int totalCases;

  @override
  List<Object> get props => [country, state, city, ibgeID, deaths, totalCases];

  @override
  bool get stringify => true;
}
