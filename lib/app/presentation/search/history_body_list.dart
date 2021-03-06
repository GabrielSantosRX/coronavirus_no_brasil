import 'package:coronavirus_no_brasil/app/models/city_model.dart';
import 'package:coronavirus_no_brasil/app/presentation/dashboard/dashboard_controller.dart';
import 'package:coronavirus_no_brasil/core/constants.dart';
import 'package:coronavirus_no_brasil/injection_container.dart';
import 'package:flutter/material.dart';

class HistoryBodyList extends StatelessWidget {
  final List<CityModel> citiesList;

  HistoryBodyList({this.citiesList});

  final DashboardController _dashboardController = getIt<DashboardController>();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 24, right: 242, bottom: 12, left: 24),
            child: Text(
              citiesList.isEmpty ? '' : citiesList.length > 1 ? 'Resultados' : 'Resultado',
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
                itemCount: citiesList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 60,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(citiesList[index].state),
                        backgroundColor: Constants.colorPrimary,
                        foregroundColor: Colors.white,
                      ),
                      title: Text(
                        citiesList[index].city,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(color: Constants.colorHeading),
                      ),
                      onTap: () {
                        print('selected ${citiesList[index]}');
                        _dashboardController.searchText = citiesList[index].cityQuery;
                        _dashboardController.citySelected = citiesList[index];
                        FocusScope.of(context).requestFocus(FocusNode());
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
