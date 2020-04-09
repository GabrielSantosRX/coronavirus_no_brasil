import 'package:coronavirus_no_brasil/app/presentation/search/views/history_body_list.dart';
import 'package:coronavirus_no_brasil/core/fade_animation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.3,
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(height: 16),
              HistoryBodyList(
                historyWord: 'teste',
              )
            ],
          )
        ],
      ),
    );
  }
}