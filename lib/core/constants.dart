import 'package:flutter/material.dart';

class Constants {
  // colors
  static const Color colorPrimary = Color.fromARGB(255, 75, 206, 170);
  static const Color colorPageBg = Color(0xFFF8F8F8);
  static const Color colorHeading = Color(0xFF0A151F);
  static const Color colorParagraph = Color(0xFF4B5866);
  static const Color colorParagraph2 = Color(0xFF758291);
  static const Color colorText = Color.fromARGB(255, 50, 56, 74);
  // static const Color colorVowelBg = Color(0xFFF0F0F0);
  // static const Color colorUnifiedWordBg = Color(0xFFE8F0F1);
  // static const Color colorUnifiedWordSearch = Color(0xFF73A5AA);
  // static const Color colorUnifiedWordText = Color(0xFF2E494C);
  static const Color colorVersionText = Color(0xFFF3A5B1);
  static const Color colorDrawerButton = Color(0xFFE8EAED);
  static const Color colorBorder = Color.fromARGB(255, 119, 218, 189); // Color(0xFFF3A5B1);
  static const Color colorPullDown1 = Color.fromARGB(255, 0, 134, 96); // Color(0xFFB41830);
  static const Color colorPullDown2 = Color(0xFFDEE3E3);
  static const Color colorBackButton = Color(0xFF48515B);
  static const Color colorAppDescription = Color(0xFF33414C);
  static const Color colorBottomSheetItemHeader = Color(0xFF183148);
  static const Color colorBottomSheetDivider = Color(0xFFEEF0F2);

  // fonts
  static const double fontSizeCaption = 12;
  static const double fontSizeBody2 = 14;
  static const double fontSizeBody = 16;
  static const double fontSizeTitle = 22;
  static const double fontSizeHeadline = 24;
  static const double fontSizeDisplay = 32;
  static const double fontSizeIdiomCardTitle = 18;
  static const double fontSizeIdiomCardContent = 12;

  // strings
  static const String appName = 'Coronavirus No Brasil';
  static const String appDescription = 'Contador de casos de Covid-19 no Brasil';
  static const String appVersion = 'v.1.0';
  static const String appLongRichDescription = '';
  static const String appLongDescription = '';

  // Screens
  static const String splashScreen = '/';
  static const String startupNavigator = '/startup';
  static const String dashboardScreen = '/dashboard';

  // Assets
  static const String svgLogo = 'assets/logo_w.svg';
  static const String svgLogoName = 'assets/logo_name.svg';
  //static const String svgLogoRed = 'assets/logo_red.svg';

  // Urls
  static const String urlGitHubApi = 'https://api.github.com/repos/wcota/covid19br/commits?path=cases-brazil-cities.csv&page=1&per_page=1';
  static const String urlGitHubCitiesCSV = 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities.csv';
  static const String urlBrasilioCityCasesAPI = 'https://brasil.io/api/dataset/covid19/caso/data';

  // region LocalCacha
  static const hiveBox = 'CORONAVIRUS_BRAZIL_BOX';
  static const cachedCitiesLastUpdate = 'CACHED_CITIES_LAST_UPDATE';
  static const cachedCitiesCSV = 'CACHED_CITIES_CSV';
}
