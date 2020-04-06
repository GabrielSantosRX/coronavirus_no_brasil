import 'package:coronavirus_no_brasil/app/app_constants.dart';
import 'package:coronavirus_no_brasil/app/dashboard/dashboard_screen.dart';
import 'package:coronavirus_no_brasil/app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CoronavirusNoBrasil());

class CoronavirusNoBrasil extends StatefulWidget {
  @override
  _CoronavirusNoBrasilState createState() => _CoronavirusNoBrasilState();
}

class _CoronavirusNoBrasilState extends State<CoronavirusNoBrasil> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: AppConstant.appName,
      initialRoute: AppConstant.splashScreen,
      routes: {
        AppConstant.splashScreen: (context) => const SplashScreen(),
        AppConstant.dashboardScreen: (context) => DashboardScreen(),
      },
    );
  }
}
