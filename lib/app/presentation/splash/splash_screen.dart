import 'dart:io';

import 'package:coronavirus_no_brasil/app/presentation/splash/splash_controller.dart';
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
  void startTimeout() {
    //while (!controller.isDataLoaded) {
    Future.delayed(const Duration(seconds: 3), () {
      print('...');
    });
    //}

    Navigator.pushReplacementNamed(context, Constants.dashboardScreen);
  }

  SplashController controller = sl<SplashController>();

  @override
  void initState() {
    super.initState();
    //startTimeout();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    Text(Constants.appName,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 21),
                    (Platform.isIOS)
                        ? const CupertinoActivityIndicator(
                            animating: true,
                            radius: 23.45,
                          )
                        : const CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          )));
}
