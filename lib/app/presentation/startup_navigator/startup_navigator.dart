import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_screen.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:flutter/material.dart';

class StartupNavigator extends StatefulWidget {
  @override
  _StartupNavigatorState createState() => _StartupNavigatorState();
}

class _StartupNavigatorState extends State<StartupNavigator> {
  int _currentPage = 1;

  final List<Widget> _screens = [
    const Center(child: Text('Todo')),
    DashboardScreen(),
    const Center(child: Text('Todo 2')),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
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
          style: TabStyle.fixedCircle,
          items: <TabItem>[
            TabItem(icon: Icons.local_hospital, title: ''),
            TabItem(icon: Icons.search, title: ''),
            TabItem(icon: Icons.bookmark_border, title: ''),
          ],
        ),
        body: _screens[_currentPage],
      );
}
