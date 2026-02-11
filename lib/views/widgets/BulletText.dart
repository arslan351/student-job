import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  final String text;
  final double fontSize;
  final int fontColor;

  const BulletText({
    super.key,
    required this.text,
    required this.fontSize, required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            height: 1.4,
            color: Color(fontColor),
          ),
        ),
        SizedBox(width: 4,),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              height: 1.4,
              color: Color(fontColor),
            ),
          ),
        ),
      ],
    );
  }
}
