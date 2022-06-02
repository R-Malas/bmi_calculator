import 'package:bmi_calculator/core/layout/theme_const.dart';
import 'package:bmi_calculator/shared_widgets/base_card_widget.dart';
import 'package:flutter/material.dart';

class NumberInputWidget extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color color;
  final double value;
  final String label;
  final void Function() onIncrement;
  final void Function() onDecrement;

  const NumberInputWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.padding,
      required this.color,
      required this.value,
      required this.label,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(children: [
      Text(label, style: kLabelTextStyle),
      const SizedBox(height: 4),
      Text(value.toString(), style: kNumberTextStyle),
      const SizedBox(height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              heroTag: key.toString() + '1',
              elevation: 0.0,
              mini: true,
              onPressed: onDecrement,
              child: const Icon(Icons.remove, color: Colors.white),
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF4C4F5E)),
          FloatingActionButton(
              heroTag: key.toString() + '2',
              elevation: 0.0,
              mini: true,
              onPressed: onIncrement,
              child: const Icon(Icons.add, color: Colors.white),
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF4C4F5E)),
        ],
      )
    ], width: width, height: height, padding: padding, color: color);
  }
}
