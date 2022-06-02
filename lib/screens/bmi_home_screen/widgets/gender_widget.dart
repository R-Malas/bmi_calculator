import 'package:bmi_calculator/core/models/gender_enum.dart';
import 'package:bmi_calculator/shared_widgets/base_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/core/layout/theme_const.dart';

class GenderWidget extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color color;
  final Gender gender;
  final void Function() onPress;

  const GenderWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.padding,
      required this.color,
      required this.gender,
      required this.onPress})
      : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPress,
        child: BaseCardWidget(
            children: [
              Icon(
                widget.gender == Gender.male ? Icons.male : Icons.female,
                color: Colors.white,
                size: 100,
              ),
              Text(
                widget.gender == Gender.male ? 'MALE' : 'FEMALE',
                style: kLabelTextStyle,
              )
            ],
            width: widget.width,
            height: widget.height,
            padding: widget.padding,
            color: widget.color));
  }
}
