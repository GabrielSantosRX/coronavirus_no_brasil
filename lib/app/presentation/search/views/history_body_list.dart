import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_controller.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:coronavirus_no_brasil/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HistoryBodyList extends StatefulWidget {
  final List<CityModel> citiesList;

  const HistoryBodyList({this.citiesList});

  @override
  _HistoryBodyListState createState() => _HistoryBodyListState();
}

class _HistoryBodyListState extends State<HistoryBodyList> {
  @observable
  List<CityModel> citiesList;

  final DashboardController _dashboardController = getIt<DashboardController>();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 24, right: 242, bottom: 12, left: 24),
            child: Text(
              'Resultados',
              style: Theme.of(context).textTheme.body2.copyWith(color: Constants.colorParagraph2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.citiesList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(widget.citiesList[index].state),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      title: Text(
                        widget.citiesList[index].city,
                        style: Theme.of(context).textTheme.body2.copyWith(color: Constants.colorHeading),
                      ),
                      subtitle: Text('Casos Confirmados: ${widget.citiesList[index].totalCases}'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        print('selected ${widget.citiesList[index]}');
                        _dashboardController.searchText = widget.citiesList[index].cityQuery;
                        _dashboardController.citySelected = widget.citiesList[index];
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
