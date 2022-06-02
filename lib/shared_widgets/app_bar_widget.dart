import 'package:bmi_calculator/core/layout/theme_const.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('BMI Calculator'),
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: kInactiveCardColour,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
