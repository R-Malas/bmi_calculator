import 'gender_enum.dart';

class UserDataModel {
  // fields
  late Gender gender;
  late double _height;
  late double _weight;
  late int _age;

  // properties
  double get height => _height;

  set height(double value) {
    if (value < 30) {
      _height = 30;
    } else if (value > 210) {
      _height = 210;
    } else {
      _height = value;
    }
  }

  double get weight => _weight;

  set weight(double value) {
    if (value < 10) {
      _weight = 10;
    } else if (value > 500) {
      _weight = 500;
    } else {
      _weight = value;
    }
  }

  int get age => _age;

  set age(int value) {
    if (value < 1) {
      _age = 1;
    } else if (value > 100) {
      _age = 100;
    } else {
      _age = value;
    }
  }

  // constructor
  UserDataModel(
      {required int age,
      required this.gender,
      required double height,
      required double weight}) {
    this.age = age;
    this.height = height;
    this.weight = weight;
  }
}
