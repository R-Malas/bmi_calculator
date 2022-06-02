import 'package:bmi_calculator/core/models/bmi_data_model.dart';
import 'package:bmi_calculator/screens/bmi_home_screen/bmi_home_screen.dart';
import 'package:bmi_calculator/screens/bmi_result_screen/bmi_results_screen.dart';
import 'package:bmi_calculator/screens/not_found_screen/not_found_screen.dart';
import 'package:flutter/material.dart';

class RouteManagement {
  static const String root = '/';
  static const String bmiResult = '/bmi-result';
  static const String notFount = '/not-found';

  RouteManagement._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routeName = settings.name;

    switch (routeName) {
      case root:
        return MaterialPageRoute(builder: (_) => const BmiHomeScreen());

      case bmiResult:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (_) => BmiResultScreen(
                  bmiResult: settings.arguments as BmiDataModel));
        }
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
