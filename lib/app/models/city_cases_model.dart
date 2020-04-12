// To parse this JSON data, do
//
//     final cityCasesModel = cityCasesModelFromJson(jsonString);

import 'dart:convert';

class CityCasesModel {
  final int count;
  final dynamic next;
  final dynamic previous;
  final List<CovidCase> covidCases;

  CityCasesModel({
    this.count,
    this.next,
    this.previous,
    this.covidCases,
  });

  CityCasesModel copyWith({
    int count,
    next,
    previous,
    List<CovidCase> covidCases,
  }) =>
      CityCasesModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        covidCases: covidCases ?? this.covidCases,
      );

  factory CityCasesModel.fromRawJson(String str) => CityCasesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityCasesModel.fromJson(Map<String, dynamic> json) => CityCasesModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        covidCases: List<CovidCase>.from(json['results'].map((x) => CovidCase.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': List<dynamic>.from(covidCases.map((x) => x.toJson())),
      };
}

class CovidCase implements Comparable<CovidCase> {
  final String city;
  final String cityIbgeCode;
  final int confirmed;
  final double confirmedPer100KInhabitants;
  final DateTime date;
  final double deathRate;
  final int deaths;
  final int estimatedPopulation2019;
  final bool isLast;
  final int orderForPlace;
  final String placeType;
  final String state;

  CovidCase({
    this.city,
    this.cityIbgeCode,
    this.confirmed,
    this.confirmedPer100KInhabitants,
    this.date,
    this.deathRate,
    this.deaths,
    this.estimatedPopulation2019,
    this.isLast,
    this.orderForPlace,
    this.placeType,
    this.state,
  });

  CovidCase copyWith({
    String city,
    String cityIbgeCode,
    int confirmed,
    double confirmedPer100KInhabitants,
    DateTime date,
    double deathRate,
    int deaths,
    int estimatedPopulation2019,
    bool isLast,
    int orderForPlace,
    String placeType,
    String state,
  }) =>
      CovidCase(
        city: city ?? this.city,
        cityIbgeCode: cityIbgeCode ?? this.cityIbgeCode,
        confirmed: confirmed ?? this.confirmed,
        confirmedPer100KInhabitants:
            confirmedPer100KInhabitants ?? this.confirmedPer100KInhabitants,
        date: date ?? this.date,
        deathRate: deathRate ?? this.deathRate,
        deaths: deaths ?? this.deaths,
        estimatedPopulation2019: estimatedPopulation2019 ?? this.estimatedPopulation2019,
        isLast: isLast ?? this.isLast,
        orderForPlace: orderForPlace ?? this.orderForPlace,
        placeType: placeType ?? this.placeType,
        state: state ?? this.state,
      );

  factory CovidCase.fromRawJson(String str) => CovidCase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CovidCase.fromJson(Map<String, dynamic> json) => CovidCase(
        city: json['city'],
        cityIbgeCode: json['city_ibge_code'],
        confirmed: json['confirmed'],
        confirmedPer100KInhabitants: json['confirmed_per_100k_inhabitants']?.toDouble(),
        date: DateTime.parse(json['date']),
        deathRate: json['death_rate']?.toDouble(),
        deaths: json['deaths'],
        estimatedPopulation2019: json['estimated_population_2019'],
        isLast: json['is_last'],
        orderForPlace: json['order_for_place'],
        placeType: json['place_type'],
        state: json['state'],
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'city_ibge_code': cityIbgeCode,
        'confirmed': confirmed,
        'confirmed_per_100k_inhabitants': confirmedPer100KInhabitants,
        'date':
            '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
        'death_rate': deathRate,
        'deaths': deaths,
        'estimated_population_2019': estimatedPopulation2019,
        'is_last': isLast,
        'order_for_place': orderForPlace,
        'place_type': placeType,
        'state': state,
      };

  @override
  String toString() => '$city $confirmed';

  @override
  int compareTo(CovidCase other) => date.compareTo(other.date);
}
