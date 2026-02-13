import 'package:flutter/material.dart';
import 'package:student_jobs/models/Card.dart';
import 'package:student_jobs/models/Enums/ApplicationStatus.dart';
import 'package:student_jobs/models/MyApplication.dart';
import 'package:student_jobs/views/my_apps/widgets/CardApp.dart';
import 'package:student_jobs/views/my_apps/widgets/jobAppBottomSheet.dart';
import 'package:student_jobs/views/widgets/BottomSheetModel.dart';

class MyAppsView extends StatefulWidget {
  const MyAppsView({super.key});
  @override
  State<MyAppsView> createState() => _MyAppsViewState();
}

class _MyAppsViewState extends State<MyAppsView> {

  List<MyApplicationModel> applications = [];

  @override
  void initState() {
    super
        .initState();
    applications = [
      MyApplicationModel(
        CardDto(
          logoPath: "",
          title: "Vendeur Boutique Djezzy",
          location: "Alger - Bab Ezzouar",
          salary: "45 000 DZ / Mois",
          jobType: "Part-time",
          duration: "6 Months",
          deadline: "",
          deadLineValue: "",
        ),
        ApplicationStatus.PENDING,
        DateTime(2026, 03, 03),
        false,
        statusList:["Please fill out the rejected forms and try again."],
      ),
      MyApplicationModel(
        CardDto(
          logoPath: "",
          title: "Vendeur Boutique Djezzy",
          location: "Alger - Bab Ezzouar",
          salary: "45 000 DZ / Mois",
          jobType: "Part-time",
          duration: "6 Months",
          deadline: "",
          deadLineValue: "",
        ),
        ApplicationStatus.PENDING,
        DateTime(2026, 03, 03),
        true,
        statusList:["Please fill out the rejected forms and try again."],
      ),
      MyApplicationModel(
        CardDto(
          logoPath: "",
          title: "Vendeur Boutique Djezzy",
          location: "Boumerdes - Corso",
          salary: "40 000 DZ / Mois",
          jobType: "Full-time",
          duration: "1 Year",
          deadline: "",
          deadLineValue: "",
        ),
        ApplicationStatus.APPROVED,
        DateTime(2026, 02, 12),
        false,
        statusList:["Congratulations your application have been Accepted for this job"],
      ),
      MyApplicationModel(
        CardDto(
          logoPath: "",
          title: "Vendeur Boutique Djezzy",
          location: "Alger - Dar el Beida",
          salary: "40 000 DZ / Mois",
          jobType: "Full-time",
          duration: "6 Months",
          deadline: "",
          deadLineValue: "",
        ),
        ApplicationStatus.REJECTED,
        DateTime(2026, 02, 12),
        false,
        statusList:["Thank you for your interest, but you were not selected. However, you can always apply for other job opportunities."],
      ),
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
              child: Column(
                spacing: 16,
                children:
                  applications.asMap().entries.map((entry){
                    //final index = entry.key;
                    final MyApplicationModel jobApplication = entry.value;
                    final CardDto card = entry.value.jobInfo;
                    final status = entry.value.status;
                    final appliedOn = entry.value.appliedOn;
                    final profileCompletion = entry.value.profileCompletion;
                    final statusList = entry.value.statusList ;

                    return CardApp(
                      myAppModel: jobApplication,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            final appDetails = MyApplicationModel(card, status, appliedOn,profileCompletion, statusList: statusList);
                            return BottomSheetModel(child: JobAppBottomSheet(appDetails: appDetails ,));
                          },
                        );
                      },
                    );
                  }).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
