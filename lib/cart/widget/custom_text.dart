import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text,
      {super.key,
      this.color = Colors.black,
      this.fontSize = 16,
      this.isBold = false});
  String text;
  Color color;
  double fontSize;
  bool isBold;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
