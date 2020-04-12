import 'dart:io';

import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_controller.dart';
import 'package:coronavirus_no_brasil/core/app_widget.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/screen_util.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:diacritic/diacritic.dart' as dic;
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String text;
  final bool isKeyboardVisible;
  final bool isScrollSearchBody;
  final double searchBoxScrollPosition;
  final FocusNode focusNode;

  SearchBox(
      {this.text,
      this.isKeyboardVisible,
      this.focusNode,
      this.isScrollSearchBody,
      this.searchBoxScrollPosition});

  final DashboardController _dashboardController = getIt<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final searchController =
        TextEditingController(text: isKeyboardVisible ? _dashboardController.searchText : text);

    searchController.addListener(() {
      print('searchController addListener ${searchController.text}');

      if (searchController.text.isEmpty) _dashboardController.citySelected = null;

      _dashboardController.searchText = dic.removeDiacritics(searchController.text.toLowerCase());
    });

    return AnimatedPositioned(
      duration: Duration(milliseconds: !isKeyboardVisible ? 220 : 0),
      top: isKeyboardVisible ? searchBoxScrollPosition : ScreenUtil.getHeight(context) * .25 - 26,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 220),
        opacity: !isScrollSearchBody && isKeyboardVisible ? 0.0 : 1.0,
        child: Row(
          children: <Widget>[
            isKeyboardVisible
                ? AnimatedOpacity(
                    opacity: !isKeyboardVisible ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          searchController.text = '';
                          _dashboardController.searchText = '';
                          print('cancel');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 12, bottom: 12, right: 4, left: 4),
                            child: (Platform.isIOS)
                                ? Icon(Icons.arrow_back_ios)
                                : Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: isKeyboardVisible ? Constants.colorBorder : Colors.transparent),
                    boxShadow: [
                      !isKeyboardVisible
                          ? BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 10))
                          : BoxShadow(
                              color: Constants.colorPrimary.withOpacity(0.1),
                              offset: const Offset(0, 0),
                              blurRadius: 3,
                              spreadRadius: 1)
                    ]),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Theme(
                  data: AppWidget.getThemeData().copyWith(primaryColor: Colors.grey),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Digite aqui a sua cidade...',
                            hintStyle: TextStyle(fontSize: 14, color: Constants.colorBackButton),
                            //
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(bottom: 0),
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
                                print('clean');
                                searchController.text = '';
                                _dashboardController.searchText = '';
                              },
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
