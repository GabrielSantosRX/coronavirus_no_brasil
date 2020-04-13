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
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;

class RegionView extends StatelessWidget {
  final List<Tuple3> stateData;

  final punctuation = intl.NumberFormat('###,###,###', 'pt_BR');

  RegionView({Key key, this.stateData}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                      child: Column(
                        children: buildStateItens(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
          ],
        ),
      );

  List<Widget> buildStateItens() => stateData
      .map(
        (s) => Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 31),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: s.value3,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${s.value1}:  ${punctuation.format(s.value2)}',
                style: const TextStyle(color: Constants.colorText),
              ),
            ],
          ),
        ),
      )
      .toList();
}
