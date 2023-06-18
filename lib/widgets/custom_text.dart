import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color color;
  final double size;
  final int? maxLine;
  const CustomText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color = Colors.black,
    this.size = 15.0,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}