import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/AlertInfosModel.dart';

class AlertPopup extends StatelessWidget {
  final AlertInfosModel alertInfosModel;

  const AlertPopup({super.key, required this.alertInfosModel});

  @override
  Widget build(BuildContext context) {
    return
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon for Auto-Entrepreneur
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: alertInfosModel.alertColor/*Color(0XFF1C9F80)*/.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(alertInfosModel.imagePath/*"assets/icons/briefcase.svg"*/,width: 45,colorFilter:ColorFilter.mode(alertInfosModel.alertColor/*Color(0XFF1C9F80)*/, BlendMode.srcIn) ,)
                  ),
                  SizedBox(height: 16),

                  // Title
                  Text(
                    alertInfosModel.title,/*'Auto-Entrepreneur',*/
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF262430),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Message
                  Text(
                    alertInfosModel.description,/*"Congratulations! Your Auto-Entrepreneur profile has been successfully verified.",*/
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9192A3),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: alertInfosModel.alertColor /*Color(0XFF1C9F80)*/,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        alertInfosModel.buttonText,/*'Go Back',*/
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }
}

