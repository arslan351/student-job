import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardJob extends StatelessWidget {
  final String assetLogo;
  final String title;
  final String location ;
  final String salary;
  final String jobType;
  final String duration ;
  final String deadline;
  final String deadLineValue;
  final VoidCallback onTap;

  const CardJob({
    super.key,
    required this.assetLogo,
    required this.title,
    required this.location,
    required this.salary,
    required this.jobType,
    required this.duration,
    required this.deadline,
    required this.deadLineValue,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            //LOGO company
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0,0,0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(width: 0.5, color: Color(0XFFEFEFEF)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
                  child: SvgPicture.asset(
                    assetLogo,
                    width: 35,
                    height: 40,
                  ),
                ),
              ),
            ),
            //company infos
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF464F5D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/archive-tick.svg",
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          location,
                          style: TextStyle(fontSize:10, color: Color(0x66262430)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                              spacing: 4.0,
                              children: [
                                SvgPicture.asset("assets/icons/money.svg"),
                                Text(salary,style:TextStyle(fontWeight: FontWeight.w600, fontSize:10,color: Color(0XFF262430)))
                              ]
                          ),
                        ),
                        Expanded(
                          child: Row(
                              spacing: 4.0,
                              children: [
                                SvgPicture.asset("assets/icons/briefcase-timer.svg"),
                                Text(jobType,style:TextStyle(fontWeight: FontWeight.w600, fontSize:10,color: Color(0XFF262430)))
                              ]
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                              spacing: 4.0,
                              children: [
                                SvgPicture.asset("assets/icons/calendar.svg"),
                                Text(duration,style:TextStyle(fontWeight: FontWeight.w600, fontSize:10,color: Color(0XFF262430)))
                              ]
                          ),
                        ),
                        Expanded(
                          child: Row(
                              spacing: 4.0,
                              children: [
                                SvgPicture.asset("assets/icons/timer.svg"),

                                Text.rich(
                                  TextSpan(
                                    text: deadline, style:TextStyle(fontWeight: FontWeight.w600, fontSize:10,color: Color(0XFF262430)),
                                    children: [
                                      TextSpan(
                                        style:TextStyle(fontWeight: FontWeight.w600, fontSize:10,color: Color(0XFFF0A14A)),
                                        text: deadLineValue
                                      )
                                    ]
                                  )
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
