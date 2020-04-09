import 'package:coronavirus_no_brasil/app/presentation/dashboard/components/cover.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/components/search_box.dart';
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
                  scale: 0.35),
              Expanded(
                child: const Text('asdf'),
              ),
            ],
          ),
          SearchBox(
            isKeyboardVisible: _isKeyboardVisible,
            //focusNode: _searchFn,
            isScrollSearchBody: _isScrollSearchBody,
            //searchBoxScrollPosition: _searchBoxScrollPosition,
          ),
          //buildMoreButton()
        ],
      ),
    );
  }
}
