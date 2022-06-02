import 'dart:math';

import 'package:bmi_calculator/core/models/user_data_model.dart';
import 'package:bmi_calculator/core/models/bmi_data_model.dart';

class BmiCalculatorService {
  final UserDataModel userData;

  BmiCalculatorService({required this.userData});

  BmiDataModel calculateUserBmi() {
    var _bmi = userData.weight / pow(userData.height / 100, 2);

    return BmiDataModel(bmi: _bmi);
  }
}
