import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget{
  final VoidCallback? onPressed;
  final Future<void> Function()? onPressedAsync;
  final Color backgroundColor;
  final Color textColor;
  //final String buttonText;
  final InlineSpan buttonTextSpan;
  final List<Widget> iconList;
  final double borderRadius ;
  final double height;

  const MyElevatedButton({super.key, this.onPressed, required this.backgroundColor, required this.textColor, required this.iconList, required this.buttonTextSpan, required this.borderRadius, this.onPressedAsync, required this.height,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed ?? onPressedAsync,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: backgroundColor.withOpacity(0.7),//Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
              child: Stack(
                alignment: Alignment.center,
                children: iconList
              ),
            ),
            /*Text(
              buttonText,//'Se connecter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor//Color.fromARGB(255, 28, 159, 128),
              ),
            ),*/
            RichText(text: buttonTextSpan , textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}