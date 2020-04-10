import 'dart:io';
import 'package:coronavirus_no_brasil/app/presentation/splash/splash_controller.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = getIt<SplashController>();

  @override
  void initState() {
    reaction<bool>(
      (x) => controller.isDataLoaded,
      (result) => Navigator.of(context).pushReplacementNamed(
          Constants.startupNavigator,
          arguments: controller.citiesList),
    );

    super.initState();
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
