import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  Color? color;
  final String text;
  double? fontSize;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.grey.shade200.withOpacity(0.6),
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
