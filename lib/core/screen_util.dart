import 'package:flutter/material.dart';

class ScreenUtil {
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double divideHeight(BuildContext context, {int divided = 1}) =>
      MediaQuery.of(context).size.height / divided;

  static double divideWidth(BuildContext context, {int divided = 1}) =>
      MediaQuery.of(context).size.width / divided;
}
