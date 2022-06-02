import 'package:bmi_calculator/core/models/bmi_enum.dart';

class BmiDataModel {
  // fields
  final double bmi;
  late BMILevels level;
  late String description;

  // constructors
  BmiDataModel({
    required this.bmi,
  }) {
    setBmiLevel();
  }

  // methods
  void setBmiLevel() {
    if (bmi >= 25) {
      description =
          'You have a higher than normal body weight. Try to exercise more.';
      level = BMILevels.overweight;
    } else if (bmi > 18.5) {
      description = 'You have a normal body weight. Good job!';
      level = BMILevels.normal;
    } else {
      description =
          'You have a lower than normal body weight. You can eat a bit more.';
      level = BMILevels.underweight;
    }
  }

  String bmiToString() {
    return bmi.toStringAsFixed(1);
  }

  /// return string of BMILevels
  String bmiLevelToString() {
    switch (level) {
      case BMILevels.underweight:
        return 'Underweight';
      case BMILevels.normal:
        return 'Normal';
      case BMILevels.overweight:
        return 'Overweight';
      default:
        return 'Normal';
    }
  }
}
