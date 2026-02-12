import 'package:flutter/material.dart';
import 'package:student_jobs/models/Card.dart';
import 'package:student_jobs/models/Enums/ApplicationStatus.dart';
import 'package:student_jobs/models/MyApplication.dart';
import 'package:student_jobs/views/my_apps/widgets/CardApp.dart';

class MyAppsView extends StatefulWidget {
  const MyAppsView({super.key});

  @override
  State<MyAppsView> createState() => _MyAppsViewState();
}

class _MyAppsViewState extends State<MyAppsView> {
  List<CardApp> cardApps =[];

  @override
  void initState(){
    super.initState();

   cardApps = [
      CardApp(myAppModel: MyApplicationModel(CardDto(logoPath: "", title: "Vendeur Boutique Djezzy", location: "Alger - Bab Ezzouar", salary: "45 000 DZ / Mois", jobType: "Part-time", duration: "6 Months", deadline: "", deadLineValue: ""), ApplicationStatus.PENDING, DateTime(2026,03,03))),
      CardApp(myAppModel: MyApplicationModel(CardDto(logoPath: "", title: "Vendeur Boutique Djezzy", location: "Alger - Hussein Dey", salary: "35 000 DZ / Mois", jobType: "Full-time", duration: "3 Months", deadline: "", deadLineValue: ""), ApplicationStatus.REJECTED, DateTime(2026,01,23))),
      CardApp(myAppModel: MyApplicationModel(CardDto(logoPath: "", title: "Vendeur Boutique Djezzy", location: "Boumerdes - Corso", salary: "40 000 DZ / Mois", jobType: "Full-time", duration: "1 Year", deadline: "", deadLineValue: ""), ApplicationStatus.APPROVED, DateTime(2026,02,12)))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "My Applications",
                  style: TextStyle(
                    color: Color(0XFF464F5D),
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(spacing: 16,
                  children: /*cardApps.asMap().entries.map((entry){
                    return Container();
                  }).toList(),*/
                cardApps.map((cardApp){
                  return cardApp;
                }).toList(),
                /*[CardApp(), CardApp()]*/),
            ),
          ],
        ),
      ),
    );
  }
}
