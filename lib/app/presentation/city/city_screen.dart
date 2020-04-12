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

class CityScreen extends StatefulWidget {
  final CityModel city;

  CityScreen({Key key, this.city}) : super(key: key);

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
    _cityController.cityCases.covidCases.sort();
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
                    children: <Widget>[
                      Text(
                        'Casos confirmados: ${widget.city}',
                        style: TextStyle(color: Constants.colorText),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: <Widget>[
                      Text(
                        (null != _cityController.cityCases)
                            ? 'first: ${_cityController.cityCases?.covidCases?.first}'
                            : 'first: asdf asdf asdf ', // ${_cityController.cityCases.covidCases}',
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
                                domainAxis: charts.DateTimeAxisSpec(
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
                ],
              ),
      ),
    );
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
