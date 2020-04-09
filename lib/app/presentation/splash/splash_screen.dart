import 'dart:async';
import 'dart:io';

import 'package:coronavirus_no_brasil/app/presentation/splash/splash_controller.dart';
import 'package:coronavirus_no_brasil/core/app_widget.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  SplashController controller = sl<SplashController>();

  void goToDashboard(BuildContext context) async {
    if (controller.isDataLoaded) {
      await Navigator.of(context)
          .pushReplacementNamed(Constants.startupNavigator);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose(); // always call super for dispose/initState
  }

  @override
  Widget build(BuildContext context) {
    const fiveSeconds = Duration(seconds: 1);
    _timer = Timer.periodic(
      fiveSeconds,
      (Timer t) => goToDashboard(context),
    );

    return Scaffold(
        body: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: const DecorationImage(
                  image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 200,
                  left: 50,
                  right: 50,
                  child: SvgPicture.asset(
                    Constants.svgLogo,
                    height: 100,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        Constants.svgLogoName,
                        height: 182,
                      ),
                      const SizedBox(height: 21),
                      Observer(
                        builder: (_) => Text(controller.status,
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .copyWith(color: Colors.white)),
                      ),
                      const SizedBox(height: 21),
                      Theme(
                        data: ThemeData(
                          accentColor: Colors.white,
                          cupertinoOverrideTheme: const CupertinoThemeData(
                              brightness: Brightness.dark),
                        ),
                        child: (!Platform.isIOS)
                            ? const CupertinoActivityIndicator(
                                animating: true,
                                radius: 23.45,
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
