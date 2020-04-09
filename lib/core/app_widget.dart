import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidget {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Constants.colorPrimary,
      //accentColor: Colors.white,
      //toggleableActiveColor: Colors.black,
      //hintColor: Colors.black,

      backgroundColor: Constants.colorPageBg,

      textTheme: TextTheme(
        display1: TextStyle(
            fontSize: Constants.fontSizeDisplay, fontWeight: FontWeight.bold),
        headline: TextStyle(
            fontSize: Constants.fontSizeHeadline, fontWeight: FontWeight.bold),
        title: TextStyle(
            fontSize: Constants.fontSizeTitle, fontWeight: FontWeight.bold),
        body1: TextStyle(fontSize: Constants.fontSizeBody),
        body2: TextStyle(
            fontSize: Constants.fontSizeBody2, fontWeight: FontWeight.bold),
        caption: TextStyle(
            fontSize: Constants.fontSizeCaption, fontWeight: FontWeight.bold),
      ),
      appBarTheme: AppBarTheme(brightness: Brightness.light),
    );
  }

  static Widget getSearchBox(isKeyboardVisible, context,
      {FocusNode focusNode}) {
    TextEditingController _searchController = TextEditingController();
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: isKeyboardVisible
                        ? Color(0xFFF3A5B1)
                        : Colors.transparent),
                boxShadow: [
                  !isKeyboardVisible
                      ? BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5.0,
                          offset: Offset(0, 10))
                      : BoxShadow(
                          color: Constants.colorPrimary.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          spreadRadius: 1)
                ]),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Theme(
              data:
                  AppWidget.getThemeData().copyWith(primaryColor: Colors.grey),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      focusNode: focusNode,
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Türkçe Sözlükte Ara...',
                        hintStyle: TextStyle(
                            fontSize: 14, color: Constants.colorBackButton),
                        //
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: Icon(
                            Icons.search,
                            color: Constants.colorBackButton,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  isKeyboardVisible
                      ? IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Constants.colorBackButton,
                            size: 20,
                          ),
                          onPressed: () {
                            _searchController.text = "";
                          },
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
        isKeyboardVisible
            ? AnimatedOpacity(
                opacity: !isKeyboardVisible ? 0.0 : 1.0,
                duration: Duration(milliseconds: 1000),
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 12, bottom: 12, right: 4, left: 4),
                        child: Text(
                          "Vazgeç",
                          style: TextStyle(
                              color: Constants.colorHeading,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  static Widget pullDown(Color color) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: 58,
            height: 4,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(14))),
          ),
        ),
      );
}
