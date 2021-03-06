import 'package:coronavirus_no_brasil/app/models/cities_collection.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/city/city_screen.dart';
import 'package:coronavirus_no_brasil/app/presentation/country/country_screen.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/components/cover.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/components/search_box.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_controller.dart';
import 'package:coronavirus_no_brasil/app/presentation/search/search_screen.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/system_overlay.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DashboardScreen extends StatefulWidget {
  final CitiesCollection citiesList;

  const DashboardScreen({Key key, this.citiesList}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isKeyboardVisible = false;
  bool _isScrollSearchBody = true;
  double _searchBoxScrollPosition = 40;
  final FocusNode _searchFn = FocusNode();
  ScrollController _scrollController;

  final _dashboardController = getIt<DashboardController>();

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _searchBoxScrollPosition = 50 - _scrollController.offset;
          _isScrollSearchBody = _scrollController.offset <= 30;
        });
      });

    _searchFn.addListener(() {
      setState(() {
        _isKeyboardVisible = _searchFn.hasFocus;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dashboardController.setCitiesData(widget.citiesList);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayHelper.statusBarBrightness(isKeyboardVisible: _isKeyboardVisible),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Cover(isKeyboardVisible: _isKeyboardVisible, context: context, scale: 0.25),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(top: _isKeyboardVisible ? 102 : 52, bottom: 32),
                    child: Observer(
                        builder: (_) => _isKeyboardVisible
                            ? SearchScreen(citiesList: _dashboardController.citiesFiltered)
                            : (null != _dashboardController.citySelected)
                                ? CityScreen(city: _dashboardController.citySelected)
                                : CountryScreen(citiesData: _dashboardController.citiesData)),
                  ),
                ),
              ),
            ],
          ),
          SearchBox(
            text: (null != _dashboardController.citySelected)
                ? _dashboardController.citySelected.cityQuery
                : _dashboardController.searchText,
            isKeyboardVisible: _isKeyboardVisible,
            focusNode: _searchFn,
            isScrollSearchBody: _isScrollSearchBody,
            searchBoxScrollPosition: _searchBoxScrollPosition,
          ),
        ],
      ),
    );
  }
}
