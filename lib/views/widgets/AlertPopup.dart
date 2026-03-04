import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/AlertInfosModel.dart';

class AlertPopup extends StatelessWidget {
  final AlertInfosModel alertInfosModel;

  const AlertPopup({super.key, required this.alertInfosModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                    color: alertInfosModel.alertColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    alertInfosModel.imagePath,
                    width: 45,
                    colorFilter: ColorFilter.mode(
                      alertInfosModel.alertColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Title
                Text(
                  alertInfosModel.title,
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
                  alertInfosModel.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF9192A3),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 24),

                // Button

                Row(
                  children: alertInfosModel.buttonList.map((btn) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btn["color"],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            btn["onPressed"]?.call();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            btn["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
