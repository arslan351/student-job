import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/Enums/ApplicationStatus.dart';
import 'package:student_jobs/models/MyApplication.dart';
import 'package:intl/intl.dart';

class CardApp extends StatelessWidget {
  final MyApplicationModel myAppModel ;

  // final CardDto cardDto ;
  // final ApplicationStatus status ;
  // final DateTime appliedOn;

  const CardApp({super.key, required this.myAppModel,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      myAppModel.jobInfo.title,
                      //"Vendeur Boutique Djezzy",
                      style: TextStyle(
                        color: Color(0XFF464F5D),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      myAppModel.jobInfo.location , //"Alger - Bab Ezzouar",
                      style: TextStyle(color: Color(0x66243066), fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.circle, color: myAppModel.getStatus()["color"] as Color,//Colors.yellow,
                        size: 10),
                    Text(
                      myAppModel.getStatus()["name"] as String,//"Under Review",
                      style: TextStyle(color: myAppModel.getStatus()["color"] as Color,//Colors.yellow,
                          fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 24,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset("assets/icons/money.svg", width: 20),
                    Text(
                      myAppModel.jobInfo.salary,//"45 000 DZ / Mois",
                      style: TextStyle(fontSize: 10, color: Color(0XFF262430)),
                    ),
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/briefcase-timer.svg",
                      width: 20,
                    ),
                    Text(
                      myAppModel.jobInfo.jobType,//"Part-time",
                      style: TextStyle(fontSize: 10, color: Color(0XFF262430)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset("assets/icons/calendar.svg", width: 20),
                    Text(
                      myAppModel.jobInfo.duration,//"6 Months",
                      style: TextStyle(fontSize: 10, color: Color(0XFF262430)),
                    ),
                  ],
                ),
                Row(
                  //Applied on :  03/03/2026  //#262430
                  spacing: 4,
                  children: [
                    Text(
                      "Applied on :",
                      style: TextStyle(fontSize: 10, color: Color(0xFF9192A3)),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(myAppModel.appliedOn),//"03/03/2026",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Color(0XFF262430),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
