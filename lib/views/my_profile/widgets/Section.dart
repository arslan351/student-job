import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Section extends StatelessWidget {
  final String title;
  final String status;
  final Map<String, dynamic> statusLogo;
  final String sectionLogo;
  final VoidCallback onTap;

  const Section({
    super.key,
    required this.title,
    required this.status,
    required this.statusLogo,
    required this.sectionLogo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius : BorderRadius.circular(16) ,
          color: Colors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    SvgPicture.asset(sectionLogo, width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0XFF464F5D),
                          ),
                        ),
                        if (status != "")
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF9192A3),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if(statusLogo["path"] != "")
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(statusLogo["path"], width: 20 , colorFilter: ColorFilter.mode(statusLogo["color"], BlendMode.srcIn),),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
