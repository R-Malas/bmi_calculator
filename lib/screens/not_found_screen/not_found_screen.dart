import 'package:bmi_calculator/route-management.dart';
import 'package:bmi_calculator/shared_widgets/app_bar_widget.dart';
import 'package:bmi_calculator/shared_widgets/base_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/core/layout/theme_const.dart' as theme_const;

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseCardWidget(
                  color: theme_const.kActiveCardColour,
                  width: -2 * widthPadding + bodyWidth,
                  height: -2 * heightPadding + bodyHeight / 2,
                  padding: EdgeInsets.symmetric(
                      horizontal: widthPadding, vertical: heightPadding),
                  children: const [
                    Center(
                      child: Text(
                        'Oops, looks like you took a wrong turn!',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: -2 * 0.02 * bodyWidth + bodyWidth,
                  height: theme_const.kBottomContainerHeight,
                  color: theme_const.kBottomContainerColour,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteManagement.root);
                    },
                    child: const Text('GO BACK',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700)),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
