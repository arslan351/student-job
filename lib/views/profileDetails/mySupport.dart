import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySupport extends StatelessWidget {
  const MySupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(spacing:12,
          children: [
            SizedBox(height: 8,),
            //FAQ
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side with icon and text
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/message-question.svg",width: 24,),
                        SizedBox(width: 8),
                        Text(
                          "FAQ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF262430),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //call and email us
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side with icon and text
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/call-calling.svg",width: 24,),
                              SizedBox(width: 8),
                              Text(
                                "Call us",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF262430),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side with icon and text
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/mail.svg",width: 24,),
                              SizedBox(width: 8),
                              Text(
                                "Email us",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF262430),
                                ),
                              ),
                            ],
                          ),
                  
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            //rate us
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side with icon and text
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/star.svg",width: 24,),
                        SizedBox(width: 8),
                        Text(
                          "Rate us",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF262430),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
