import 'package:coronavirus_no_brasil/app/presentation/splash/splash_screen.dart';
import 'package:coronavirus_no_brasil/app/presentation/startup_navigator/startup_navigator.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/injection_container.dart' as get_it;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  runApp(CoronavirusNoBrasil());
}

class CoronavirusNoBrasil extends StatefulWidget {
  @override
  _CoronavirusNoBrasilState createState() => _CoronavirusNoBrasilState();
}

class _CoronavirusNoBrasilState extends State<CoronavirusNoBrasil> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primaryColor: Constants.colorPrimary,
      ),
      initialRoute: Constants.splashScreen,
      routes: {
        Constants.splashScreen: (context) => const SplashScreen(),
        Constants.startupNavigator: (context) => StartupNavigator(),
      },
    );
  }
}
