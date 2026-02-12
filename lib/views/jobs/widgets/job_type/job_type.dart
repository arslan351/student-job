import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobType extends StatelessWidget {
  final bool isClicked;
  final String svgAssetPicture;
  final String title;
  final VoidCallback onTap;

  const JobType({
    super.key,
    required this.isClicked,
    required this.svgAssetPicture,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 82,
        decoration: isClicked
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF27A99A), Color(0xFF19363A)],
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgAssetPicture,
              width: 34,
              colorFilter: ColorFilter.mode(
                isClicked ? Colors.white : Color(0XFFF0A14A),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isClicked ? Colors.white : Color(0xFF262430),
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
