import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_screen.dart';
import 'package:coronavirus_no_brasil/app/presentation/information/symptoms_screen.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:flutter/material.dart';

class StartupNavigator extends StatefulWidget {
  @override
  _StartupNavigatorState createState() => _StartupNavigatorState();
}

class _StartupNavigatorState extends State<StartupNavigator> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final List<CityModel> _citiesList = ModalRoute.of(context).settings.arguments;

    final _screens = <Widget>[
      SymptomsScreen(),
      DashboardScreen(
        citiesList: _citiesList,
      ),
      const Center(child: Text('Todo 2')),
    ];

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: Constants.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: Constants.colorPrimary,
        elevation: 0.5,
        //height causes layout overflow on some devies
        //height: 56,
        onTap: (int val) {
          if (val == _currentPage) return;
          setState(() {
            _currentPage = val;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.reactCircle,
        items: <TabItem>[
          TabItem(icon: Icons.local_hospital, title: ''),
          TabItem(icon: Icons.search, title: ''),
          TabItem(icon: Icons.bookmark_border, title: ''),
        ],
      ),
      body: _screens[_currentPage],
    );
  }
}
