import 'package:bmi_calculator/core/layout/theme_const.dart' as theme_const;
import 'package:bmi_calculator/core/models/bmi_data_model.dart';
import 'package:bmi_calculator/route-management.dart';
import 'package:bmi_calculator/shared_widgets/app_bar_widget.dart';
import 'package:bmi_calculator/shared_widgets/base_card_widget.dart';
import 'package:bmi_calculator/shared_widgets/expanded_button_widget.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final BmiDataModel bmiResult;

  const BmiResultScreen({Key? key, required this.bmiResult}) : super(key: key);

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
          var cardRowHeight = bodyHeight - theme_const.kBottomContainerHeight;
          var widthPadding = 0.03 * bodyWidth;
          var heightPadding = 0.02 * cardRowHeight;

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Your Result',
                      style: theme_const.kTitleTextStyle,
                    ),
                  ),
                ),
              ),
              BaseCardWidget(
                color: theme_const.kActiveCardColour,
                padding: EdgeInsets.symmetric(
                    vertical: heightPadding, horizontal: widthPadding),
                height: bodyHeight / 2,
                width: bodyWidth,
                children: [
                  const Text(
                    'BMI Result',
                    style: theme_const.kBMITextStyle,
                  ),
                  Text(
                    bmiResult.bmiToString(),
                    style: theme_const.kResultTextStyle,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Normal BMI Range: 18.5-25 kg/m2',
                    style: theme_const.kResultTextStyle,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    bmiResult.description,
                    textAlign: TextAlign.center,
                    style: theme_const.kBodyTextStyle,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: heightPadding / 2),
                child: ExpandedButton(
                  width: -2 * 0.02 * bodyWidth + bodyWidth,
                  height: theme_const.kBottomContainerHeight,
                  color: theme_const.kBottomContainerColour,
                  text: 'RE-CALCULATE',
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteManagement.root);
                  },
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}
