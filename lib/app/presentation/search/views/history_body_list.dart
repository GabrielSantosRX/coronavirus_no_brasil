import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:flutter/material.dart';

class HistoryBodyList extends StatelessWidget {
  HistoryBodyList({this.historyWord});

  final String historyWord;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 24, right: 242, bottom: 12, left: 24),
            child: Text(
              'Resultados',
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(color: Constants.colorParagraph2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            historyWord,
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .copyWith(color: Constants.colorHeading),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
