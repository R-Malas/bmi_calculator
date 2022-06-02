import 'package:flutter/material.dart';

class BaseCardWidget extends StatelessWidget {
  final List<Widget> children;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color color;

  const BaseCardWidget(
      {Key? key,
      required this.children,
      required this.width,
      required this.height,
      required this.padding,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
