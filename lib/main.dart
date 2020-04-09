import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_screen.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection_container.dart' as di;

import 'app/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(CoronavirusNoBrasil());
}

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
      title: Constants.appName,
      initialRoute: Constants.splashScreen,
      routes: {
        Constants.splashScreen: (context) => const SplashScreen(),
        Constants.dashboardScreen: (context) => DashboardScreen(),
      },
    );
  }
}
