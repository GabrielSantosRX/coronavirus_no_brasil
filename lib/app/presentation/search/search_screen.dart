import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/search/views/history_body_list.dart';
import 'package:coronavirus_no_brasil/core/fade_animation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<CityModel> citiesList;
  const SearchScreen({Key key, this.citiesList}) : super(key: key);

  @override
  Widget build(BuildContext context) => FadeAnimation(
        0.3,
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 16),
                HistoryBodyList(
                  citiesList: citiesList,
                )
              ],
            )
          ],
        ),
      );
}
