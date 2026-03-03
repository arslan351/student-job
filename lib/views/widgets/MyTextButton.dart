import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final Color borderColor;
  final EdgeInsets padding ;
  final List<Widget> listIcon;
  final InlineSpan buttonText;

  const MyTextButton ({super.key, required this.borderColor, required this.padding, required this.listIcon, required this.buttonText });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        side: BorderSide(color:borderColor),
        padding: padding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8.0,
        children: [
          Stack(
            alignment: Alignment.center,
            children:
            listIcon
          ),
          RichText(text: buttonText , textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}




