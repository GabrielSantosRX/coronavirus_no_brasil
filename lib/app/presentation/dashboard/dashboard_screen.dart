import 'package:coronavirus_no_brasil/app/presentation/dashboard/components/cover.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/components/search_box.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/views/city_data_view.dart';
import 'package:coronavirus_no_brasil/app/presentation/search/search_screen.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/system_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isKeyboardVisible = false;
  bool _isScrollSearchBody = true;
  double _searchBoxScrollPosition = 40;
  FocusNode _searchFn = FocusNode();
  ScrollController _scrollController;

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayHelper.statusBarBrightness(_isKeyboardVisible),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Cover(
                  isKeyboardVisible: _isKeyboardVisible,
                  context: context,
                  scale: 0.25),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: _isKeyboardVisible ? 102 : 52, bottom: 32),
                    child: _isKeyboardVisible ? SearchScreen() : CityDataView(),
                  ),
                ),
              ),
            ],
          ),
          SearchBox(
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
