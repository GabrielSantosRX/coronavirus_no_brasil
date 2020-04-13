import 'dart:core';
import 'dart:io';
import 'dart:math' show pi;
import 'package:coronavirus_no_brasil/app/models/cities_collection.dart';
import 'package:coronavirus_no_brasil/app/models/city_cases_model.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/city/city_controller.dart';
import 'package:coronavirus_no_brasil/app/presentation/country/region_view.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/gauge_segment.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart' as intl;

class CountryScreen extends StatelessWidget {
  final CitiesCollection citiesData;
  final punctuation = intl.NumberFormat('###,###,###', 'pt_BR');

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

  int get totalCasesInNorth =>
      totalCasesInAC +
      totalCasesInAP +
      totalCasesInAM +
      totalCasesInPA +
      totalCasesInRO +
      totalCasesInRR +
      totalCasesInTO;

  int get totalCasesInNortheast =>
      totalCasesInAL +
      totalCasesInBA +
      totalCasesInCE +
      totalCasesInMA +
      totalCasesInPB +
      totalCasesInPE +
      totalCasesInPI +
      totalCasesInRN +
      totalCasesInSE;

  int get totalCasesInMidwest => totalCasesInGO + totalCasesInMT + totalCasesInMS;

  int get totalCasesInSoutheast =>
      totalCasesInES + totalCasesInMG + totalCasesInRJ + totalCasesInSP;

  int get totalCasesInSouth => totalCasesInPR + totalCasesInRS + totalCasesInSC;

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

  List<charts.Series<GaugeSegment, String>> _createGaugeData() {
    final data = [
      // north green
      GaugeSegment('AC', totalCasesInAC, color: charts.Color.fromHex(code: '#059142')),
      GaugeSegment('AP', totalCasesInAP, color: charts.Color.fromHex(code: '#06a94d')),
      GaugeSegment('AM', totalCasesInAM, color: charts.Color.fromHex(code: '#06c258')),
      GaugeSegment('PA', totalCasesInPA, color: charts.Color.fromHex(code: '#07da63')),
      GaugeSegment('RO', totalCasesInRO, color: charts.Color.fromHex(code: '#08f26e')),
      GaugeSegment('RR', totalCasesInRR, color: charts.Color.fromHex(code: '#68BB59')),
      GaugeSegment('TO', totalCasesInTO, color: charts.Color.fromHex(code: '#76BA1B')),
      // northeast yellow
      GaugeSegment('AL', totalCasesInAL, color: charts.Color.fromHex(code: '#F6C616')),
      GaugeSegment('BA', totalCasesInBA, color: charts.Color.fromHex(code: '#F9E231')),
      GaugeSegment('CE', totalCasesInCE, color: charts.Color.fromHex(code: '#FEF54F')),
      GaugeSegment('MA', totalCasesInMA, color: charts.Color.fromHex(code: '#FFFF9F')),
      GaugeSegment('PB', totalCasesInPB, color: charts.Color.fromHex(code: '#FFF700')),
      GaugeSegment('PE', totalCasesInPE, color: charts.Color.fromHex(code: '#F7D214')),
      GaugeSegment('PI', totalCasesInPI, color: charts.Color.fromHex(code: '#FAE11F')),
      GaugeSegment('RN', totalCasesInRN, color: charts.Color.fromHex(code: '#FCF029')),
      GaugeSegment('SE', totalCasesInSE, color: charts.Color.fromHex(code: '#FFFF33')),
      // midwest red
      GaugeSegment('GO', totalCasesInGO, color: charts.Color.fromHex(code: '#933b27')),
      GaugeSegment('MT', totalCasesInMT, color: charts.Color.fromHex(code: '#b04632')),
      GaugeSegment('MS', totalCasesInMS, color: charts.Color.fromHex(code: '#cf513d')),
      // df violet
      GaugeSegment('DF', totalCasesInDF, color: charts.Color.fromHex(code: '#B83384')),
      // Southeast blue
      GaugeSegment('ES', totalCasesInES, color: charts.Color.fromHex(code: '#2154EE')),
      GaugeSegment('MG', totalCasesInMG, color: charts.Color.fromHex(code: '#2A6FEA')),
      GaugeSegment('RJ', totalCasesInRJ, color: charts.Color.fromHex(code: '#3796DF')),
      GaugeSegment('SP', totalCasesInSP, color: charts.Color.fromHex(code: '#41B9D4')),
      // South purple
      GaugeSegment('PR', totalCasesInPR, color: charts.Color.fromHex(code: '#481391')),
      GaugeSegment('RS', totalCasesInRS, color: charts.Color.fromHex(code: '#7436b4')),
      GaugeSegment('SC', totalCasesInSC, color: charts.Color.fromHex(code: '#684299')),
    ];

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        colorFn: (_, index) =>
            data[index].color, // charts.MaterialPalette.green.makeShades(data.length)[index],
        domainFn: (GaugeSegment x, _) => x.segment,
        measureFn: (GaugeSegment y, _) => y.value,
        data: data,
      )
    ];
  }

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
                  '${punctuation.format(totalCasesInBrazil)}',
                  style: const TextStyle(
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
              children: const <Widget>[
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
                  'a última atualização foi no dia ${citiesData.lastUpdate.day}/${citiesData.lastUpdate.month}.',
                  style: const TextStyle(color: Constants.colorText),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Container(
              height: MediaQuery.of(context).size.width - 50,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  SvgPicture.asset(
                    Constants.svgBrazilMap,
                    height: MediaQuery.of(context).size.width - 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width - 182,
                    width: MediaQuery.of(context).size.width - 182,
                    child: charts.PieChart(_createGaugeData(),
                        animate: false,
                        defaultRenderer: charts.ArcRendererConfig(
                            strokeWidthPx: 0,
                            arcWidth: 30,
                            startAngle: 4 / 5 * pi,
                            arcLength: 7 / 5 * pi)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                              ),
                              title: Text(
                                'Norte:  ${punctuation.format(totalCasesInNorth)}',
                                style: const TextStyle(color: Constants.colorText),
                              ),
                            ),
                            RegionView(
                              stateData: [
                                tuple3('AC', totalCasesInAC, Hexcolor(Constants.colorStateAC)),
                                tuple3('AP', totalCasesInAP, Hexcolor(Constants.colorStateAP)),
                                tuple3('AM', totalCasesInAM, Hexcolor(Constants.colorStateAM)),
                                tuple3('PA', totalCasesInPA, Hexcolor(Constants.colorStatePA)),
                                tuple3('RO', totalCasesInRO, Hexcolor(Constants.colorStateRO)),
                                tuple3('RR', totalCasesInRR, Hexcolor(Constants.colorStateRR)),
                                tuple3('TO', totalCasesInTO, Hexcolor(Constants.colorStateTO)),
                              ],
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.yellow,
                              ),
                              title: Text(
                                'Nordeste:  ${punctuation.format(totalCasesInNortheast)}',
                                style: const TextStyle(color: Constants.colorText),
                              ),
                            ),
                            RegionView(
                              stateData: [
                                tuple3('AL', totalCasesInAL, Hexcolor(Constants.colorStateAL)),
                                tuple3('BA', totalCasesInBA, Hexcolor(Constants.colorStateBA)),
                                tuple3('CE', totalCasesInCE, Hexcolor(Constants.colorStateCE)),
                                tuple3('MA', totalCasesInMA, Hexcolor(Constants.colorStateMA)),
                                tuple3('PB', totalCasesInPB, Hexcolor(Constants.colorStatePB)),
                                tuple3('PE', totalCasesInPE, Hexcolor(Constants.colorStatePE)),
                                tuple3('PI', totalCasesInPI, Hexcolor(Constants.colorStatePI)),
                                tuple3('RN', totalCasesInRN, Hexcolor(Constants.colorStateRN)),
                                tuple3('SE', totalCasesInSE, Hexcolor(Constants.colorStateSE)),
                              ],
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.red,
                              ),
                              title: Text(
                                'Centro-Oeste:  ${punctuation.format(totalCasesInMidwest)}',
                                style: const TextStyle(color: Constants.colorText),
                              ),
                            ),
                            RegionView(
                              stateData: [
                                tuple3('GO', totalCasesInGO, Hexcolor(Constants.colorStateGO)),
                                tuple3('MT', totalCasesInMT, Hexcolor(Constants.colorStateMT)),
                                tuple3('MS', totalCasesInMS, Hexcolor(Constants.colorStateMS)),
                              ],
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo,
                              ),
                              title: Text(
                                'Distrito Federal:  ${punctuation.format(totalCasesInDF)}',
                                style: const TextStyle(color: Constants.colorText),
                              ),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                              title: Text(
                                'Suldeste:  ${punctuation.format(totalCasesInSoutheast)}',
                                style: const TextStyle(color: Constants.colorText),
                              ),
                            ),
                            RegionView(
                              stateData: [
                                tuple3('ES', totalCasesInES, Hexcolor(Constants.colorStateES)),
                                tuple3('MG', totalCasesInMG, Hexcolor(Constants.colorStateMG)),
                                tuple3('RJ', totalCasesInRJ, Hexcolor(Constants.colorStateRJ)),
                                tuple3('SP', totalCasesInSP, Hexcolor(Constants.colorStateSP)),
                              ],
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.purple,
                              ),
                              title: Text(
                                'Sul:  ${punctuation.format(totalCasesInSouth)}',
                                style: const TextStyle(color: Constants.colorText),
                              ),
                            ),
                            RegionView(
                              stateData: [
                                tuple3('PR', totalCasesInPR, Hexcolor(Constants.colorStatePR)),
                                tuple3('RS', totalCasesInRS, Hexcolor(Constants.colorStateRS)),
                                tuple3('SC', totalCasesInSC, Hexcolor(Constants.colorStateSC)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
          ],
        ),
      );
}
