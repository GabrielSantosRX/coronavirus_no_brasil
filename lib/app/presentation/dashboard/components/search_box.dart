import 'package:coronavirus_no_brasil/core/app_widget.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/core/screen_util.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final bool isKeyboardVisible;
  final bool isScrollSearchBody;
  final double searchBoxScrollPosition;
  final FocusNode focusNode;

  const SearchBox(
      {this.isKeyboardVisible,
      this.focusNode,
      this.isScrollSearchBody,
      this.searchBoxScrollPosition});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return AnimatedPositioned(
      duration: Duration(milliseconds: !isKeyboardVisible ? 220 : 0),
      top: isKeyboardVisible
          ? searchBoxScrollPosition
          : ScreenUtil.getHeight(context) * .25 - 26,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 220),
        opacity: !isScrollSearchBody && isKeyboardVisible ? 0.0 : 1.0,
        child: Row(
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
                            ? const Color(0xFFF3A5B1)
                            : Colors.transparent),
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
                  data: AppWidget.getThemeData()
                      .copyWith(primaryColor: Colors.grey),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Digite aqui a sua cidade...',
                            hintStyle: TextStyle(
                                fontSize: 14, color: Constants.colorBackButton),
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
                                searchController.text = '';
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
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, right: 4, left: 4),
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  color: Constants.colorHeading,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
