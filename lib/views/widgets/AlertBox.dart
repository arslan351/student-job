import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Alertbox extends StatelessWidget {
  final int backgroundColor;
  final int borderColor;
  final List<Text> textContent;
  final String svgIcon;

  const Alertbox({
    super.key,
    required this.textContent,
    required this.svgIcon,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(borderColor) /*Color(0XFFFF6369)*/),
        color: Color(backgroundColor) /*Color(0XFFF6DCDD)*/,
      ),
      child: Padding(
        padding: const EdgeInsetsGeometry.fromLTRB(18, 12, 18, 12),
        child: Row(
          spacing: 16,
          children: [
            SvgPicture.asset(
              svgIcon,
              width: 24,
              colorFilter: ColorFilter.mode(
                Color(borderColor),
                BlendMode.srcIn,
              ),
            ),
            // Icon(Icons.highlight_remove_outlined , color: Color(0XFFC7302D),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: textContent,
              /*[
                Text(
                  "Incomplete or unapproved files ",
                  style: TextStyle(color: Color(0XFF262430)),
                ),
                Text(
                  "Student Certificate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFC7302D),
                  ),
                ),
              ],*/
            ),
          ],
        ),
      ),
    );
  }
}
