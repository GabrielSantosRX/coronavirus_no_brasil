import 'dart:core';
import 'dart:io';
import 'dart:math' show pi;
import 'package:coronavirus_no_brasil/app/models/cities_collection.dart';
import 'package:coronavirus_no_brasil/app/models/city_cases_model.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/city/city_controller.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/gauge_segment.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CountryScreen extends StatelessWidget {
  final CitiesCollection citiesData;

  int totalCasesInBrazil;
  int totalCasesInAC;
  int totalCasesInAL;
  int totalCasesInAP;
  int totalCasesInAM;
  int totalCasesInBA;
  int totalCasesInCE;
  int totalCasesInDF;
  int totalCasesInES;
  int totalCasesInGO;
  int totalCasesInMA;
  int totalCasesInMT;
  int totalCasesInMS;
  int totalCasesInMG;
  int totalCasesInPA;
  int totalCasesInPB;
  int totalCasesInPR;
  int totalCasesInPE;
  int totalCasesInPI;
  int totalCasesInRJ;
  int totalCasesInRN;
  int totalCasesInRS;
  int totalCasesInRO;
  int totalCasesInRR;
  int totalCasesInSC;
  int totalCasesInSP;
  int totalCasesInSE;
  int totalCasesInTO;

  CountryScreen({Key key, this.citiesData}) : super(key: key) {
    totalCasesInBrazil = citiesData.map<int>((c) => c.totalCases).reduce((a, b) => a + b);
    totalCasesInAC = citiesData
        .where((s) => s.state == 'AC')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInAL = citiesData
        .where((s) => s.state == 'AL')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInAP = citiesData
        .where((s) => s.state == 'AP')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInAM = citiesData
        .where((s) => s.state == 'AM')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInBA = citiesData
        .where((s) => s.state == 'BA')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInCE = citiesData
        .where((s) => s.state == 'CE')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInDF = citiesData
        .where((s) => s.state == 'DF')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInES = citiesData
        .where((s) => s.state == 'ES')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInGO = citiesData
        .where((s) => s.state == 'GO')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInMA = citiesData
        .where((s) => s.state == 'MA')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInMT = citiesData
        .where((s) => s.state == 'MT')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInMS = citiesData
        .where((s) => s.state == 'MS')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInMG = citiesData
        .where((s) => s.state == 'MG')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInPA = citiesData
        .where((s) => s.state == 'PA')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInPB = citiesData
        .where((s) => s.state == 'PB')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInPR = citiesData
        .where((s) => s.state == 'PR')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInPE = citiesData
        .where((s) => s.state == 'PE')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInPI = citiesData
        .where((s) => s.state == 'PI')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInRJ = citiesData
        .where((s) => s.state == 'RJ')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInRN = citiesData
        .where((s) => s.state == 'RN')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInRS = citiesData
        .where((s) => s.state == 'RS')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInRO = citiesData
        .where((s) => s.state == 'RO')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInRR = citiesData
        .where((s) => s.state == 'RR')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInSC = citiesData
        .where((s) => s.state == 'SC')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInSP = citiesData
        .where((s) => s.state == 'SP')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInSE = citiesData
        .where((s) => s.state == 'SE')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
    totalCasesInTO = citiesData
        .where((s) => s.state == 'TO')
        .map<int>((c) => c.totalCases)
        .reduce((a, b) => a + b);
  }

  // List<charts.Series<GaugeSegment, String>> _createGaugeData() {
  //   final data = [
  //     GaugeSegment(
  //         'Casos confirmados',
  //         _cityController.cityCases.covidCases.last.confirmed -
  //             _cityController.cityCases.covidCases.last.deaths),
  //     GaugeSegment('Óbitos', _cityController.cityCases.covidCases.last.deaths),
  //   ];

  //   return [
  //     charts.Series<GaugeSegment, String>(
  //       id: 'Segments',
  //       colorFn: (_, index) => charts.MaterialPalette.green.makeShades(2)[index],
  //       domainFn: (GaugeSegment x, _) => x.segment,
  //       measureFn: (GaugeSegment y, _) => y.value,
  //       data: data,
  //     )
  //   ];
  // }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$totalCasesInBrazil',
                  style: TextStyle(
                    color: Constants.colorText,
                    fontFamily: 'LibreBaskerville-Regular',
                    fontSize: 54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Casos confirmados no Brasil',
                  style: TextStyle(color: Constants.colorText),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'até a última atualização ${citiesData.lastUpdate}',
                  style: TextStyle(color: Constants.colorText),
                ),
              ],
            ),
            const SizedBox(height: 7),
            const SizedBox(height: 7),
            const SizedBox(height: 33),
          ],
        ),
      );
}
