import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:flutter/material.dart';

class CityDataView extends StatelessWidget {
  const CityDataView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Casos confirmados:',
                style: TextStyle(color: Constants.colorProverbsIdiomsText),
              ),
            ],
          ),
          const SizedBox(height: 8),
          //IdiomCard(title: 'on para', content: 'çok az (para).'),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
