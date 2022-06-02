import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final double width;
  final double height;
  final Color color;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
