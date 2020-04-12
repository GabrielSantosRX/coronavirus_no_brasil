import 'dart:io';
import 'package:coronavirus_no_brasil/app/models/city_cases_model.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/city/city_controller.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class CityScreen extends StatefulWidget {
  final CityModel city;

  const CityScreen({Key key, this.city}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final _cityController = getIt<CityController>();

  @override
  void initState() {
    print('CityScreen initState city: ${widget.city}');
    _cityController.setCitySelected(widget.city);

    super.initState();
  }

  List<charts.Series<CovidCase, DateTime>> _createChartData() {
    return [
      charts.Series<CovidCase, DateTime>(
        id: 'Casos confirmados',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (CovidCase c, _) => c.date,
        measureFn: (CovidCase c, _) => c.confirmed,
        data: _cityController.cityCases.covidCases,
      )
    ];
  }

  List<charts.Series<GaugeSegment, String>> _createGaugeData() {
    final data = [
      GaugeSegment(
          'Casos confirmados',
          _cityController.cityCases.covidCases.last.confirmed -
              _cityController.cityCases.covidCases.last.deaths),
      GaugeSegment('Óbitos', _cityController.cityCases.covidCases.last.deaths),
    ];

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        colorFn: (_, index) {
          return charts.MaterialPalette.green.makeShades(2)[index];
        },
        domainFn: (GaugeSegment d, _) => d.segment,
        measureFn: (GaugeSegment m, _) => m.size,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Observer(
        builder: (_) => _cityController.isLoading
            ? buildLoadingView()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${_cityController.cityCases.covidCases.last.confirmed}', // ${_cityController.cityCases.covidCases}',
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
                        (_cityController.cityCases.covidCases.last.confirmed > 1)
                            ? 'Casos confirmados em ${widget.city.city}/${widget.city.state},'
                            : 'Caso confirmado em ${widget.city.city}/${widget.city.state},',
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
                        'a última atualização foi no dia ${_cityController.cityCases.covidCases.last.date.day}/${_cityController.cityCases.covidCases.last.date.month}.',
                        style: TextStyle(color: Constants.colorText),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 222,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              height: 222,
                              child: charts.TimeSeriesChart(
                                _createChartData(),
                                animate: true,
                                animationDuration: const Duration(milliseconds: 666),
                                domainAxis: const charts.DateTimeAxisSpec(
                                  tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                                    day: charts.TimeFormatterSpec(
                                        format: 'd', transitionFormat: 'dd/MM'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  ...buildDeathRows(),
                ],
              ),
      ),
    );
  }

  List<Widget> buildDeathRows() {
    return _cityController.cityCases?.covidCases?.last?.deathRate != null
        ? <Widget>[
            Row(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      child: charts.PieChart(_createGaugeData(),
                          animate: false,
                          defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 30, startAngle: 4 / 5 * pi, arcLength: 7 / 5 * pi)),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '${_cityController.cityCases.covidCases.last.deaths} ',
                          style: TextStyle(
                            color: Constants.colorText,
                            fontFamily: 'LibreBaskerville-Regular',
                            fontSize: 41,
                          ),
                        ),
                        Text(
                          (_cityController.cityCases.covidCases.last.deaths > 1)
                              ? ' óbitos registrados,'
                              : ' óbito registrado,',
                          style: TextStyle(color: Constants.colorText),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          '${(_cityController.cityCases.covidCases.last.deathRate * 100.00).toStringAsFixed(2)}% ',
                          style: TextStyle(
                            color: Constants.colorText,
                            fontFamily: 'LibreBaskerville-Regular',
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          ' dos casos confirmados.',
                          style: TextStyle(color: Constants.colorText),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            const SizedBox(height: 33),
          ]
        : [
            Text(
              'Nenhum óbito registrado.',
              style: TextStyle(color: Constants.colorText),
            ),
            const SizedBox(height: 7),
          ];
  }

  Widget buildLoadingView() => Center(
        child: (Platform.isIOS)
            ? const CupertinoActivityIndicator(
                animating: true,
                radius: 23.45,
              )
            : const CircularProgressIndicator(),
      );
}

class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
