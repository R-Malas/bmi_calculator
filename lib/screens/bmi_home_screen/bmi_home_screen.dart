import 'package:flutter/material.dart';

import 'package:bmi_calculator/core/services/bmi_calculator_service.dart';
import 'package:bmi_calculator/route-management.dart';
import 'package:bmi_calculator/core/layout/theme_const.dart';
import 'package:bmi_calculator/screens/bmi_home_screen/widgets/number_input_widget.dart';
import 'package:bmi_calculator/shared_widgets/base_card_widget.dart';
import 'package:bmi_calculator/core/models/gender_enum.dart';
import 'package:bmi_calculator/core/models/user_data_model.dart';
import 'package:bmi_calculator/screens/bmi_home_screen/widgets/gender_widget.dart';
import 'package:bmi_calculator/shared_widgets/app_bar_widget.dart';
import 'package:bmi_calculator/shared_widgets/expanded_button_widget.dart';

class BmiHomeScreen extends StatefulWidget {
  const BmiHomeScreen({Key? key}) : super(key: key);

  @override
  State<BmiHomeScreen> createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {
  // bmi data
  UserDataModel userData = UserDataModel(
      age: 20, gender: Gender.female, height: 150.0, weight: 50.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: const AppBarWidget(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              var bodyWidth = constraints.maxWidth;
              var bodyHeight = constraints.maxHeight;
              var cardRowHeight = bodyHeight - kBottomContainerHeight;
              var widthPadding = 0.03 * bodyWidth;
              var heightPadding = 0.02 * cardRowHeight;

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Gender
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GenderWidget(
                          width: -2 * widthPadding + bodyWidth / 2,
                          height: cardRowHeight / 4,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthPadding,
                              vertical: heightPadding),
                          color: userData.gender == Gender.male
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          gender: Gender.male,
                          onPress: () {
                            setState(() {
                              userData.gender = Gender.male;
                            });
                          }),
                      GenderWidget(
                          width: -2 * widthPadding + bodyWidth / 2,
                          height: cardRowHeight / 4,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthPadding,
                              vertical: heightPadding),
                          color: userData.gender == Gender.female
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          gender: Gender.female,
                          onPress: () {
                            setState(() {
                              userData.gender = Gender.female;
                            });
                          }),
                    ],
                  ),
                  // Height
                  BaseCardWidget(
                      children: [
                        const Text('HEIGHT', style: kLabelTextStyle),
                        RichText(
                            text: TextSpan(
                                text: userData.height.toStringAsFixed(1),
                                style: kNumberTextStyle,
                                children: const [
                              TextSpan(text: 'cm', style: kLabelTextStyle)
                            ])),
                        Slider(
                            value: userData.height,
                            max: 210.0,
                            min: 30.0,
                            onChanged: (value) {
                              setState(() {
                                userData.height = value;
                              });
                            })
                      ],
                      width: -2 * widthPadding + bodyWidth,
                      height: cardRowHeight / 3,
                      padding: EdgeInsets.symmetric(
                          horizontal: widthPadding, vertical: heightPadding),
                      color: kActiveCardColour),
                  // Weight and Age
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NumberInputWidget(
                        key: UniqueKey(),
                        padding: EdgeInsets.symmetric(
                            horizontal: widthPadding, vertical: heightPadding),
                        color: kActiveCardColour,
                        width: -2 * widthPadding + bodyWidth / 2,
                        height: cardRowHeight / 4,
                        label: 'WEIGHT',
                        value: userData.weight,
                        onIncrement: () {
                          setState(() {
                            userData.weight++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            userData.weight--;
                          });
                        },
                      ),
                      NumberInputWidget(
                        key: UniqueKey(),
                        padding: EdgeInsets.symmetric(
                            horizontal: widthPadding, vertical: heightPadding),
                        color: kActiveCardColour,
                        width: -2 * widthPadding + bodyWidth / 2,
                        height: cardRowHeight / 4,
                        label: 'AGE',
                        value: userData.age.toDouble(),
                        onIncrement: () {
                          setState(() {
                            userData.age++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            userData.age--;
                          });
                        },
                      ),
                    ],
                  ),
                  // Calculate button
                  ExpandedButton(
                    width: -2 * 0.02 * bodyWidth + bodyWidth,
                    height: kBottomContainerHeight,
                    color: kBottomContainerColour,
                    text: 'CALCULATE',
                    onPressed: () {
                      var bmiService = BmiCalculatorService(userData: userData);
                      var bmi = bmiService.calculateUserBmi();
                      Navigator.of(context)
                          .pushNamed(RouteManagement.bmiResult, arguments: bmi);
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}
