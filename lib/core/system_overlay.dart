import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayHelper {
  static SystemUiOverlayStyle statusBarBrightness({bool isKeyboardVisible}) =>
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isKeyboardVisible ? Brightness.dark : Brightness.light);
}
