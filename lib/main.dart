import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Coronavirus no Brasil',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Container(),
      );
}
