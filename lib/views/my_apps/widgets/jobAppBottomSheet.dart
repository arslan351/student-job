import 'package:flutter/material.dart';
import 'package:student_jobs/models/Card.dart';
import 'package:student_jobs/models/Enums/ApplicationStatus.dart';
import 'package:student_jobs/views/my_apps/widgets/CardApp.dart';
import 'package:student_jobs/views/widgets/AlertBox.dart';
import 'package:student_jobs/views/widgets/BulletText.dart';
import 'package:student_jobs/models/MyApplication.dart';

class JobAppBottomSheet extends StatelessWidget {
  final MyApplicationModel appDetails;

  const JobAppBottomSheet({super.key, required this.appDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        // Card
        CardApp(
          myAppModel: MyApplicationModel(
            CardDto(
              logoPath: "",
              title: appDetails.jobInfo.title,
              location: appDetails.jobInfo.location,
              salary: appDetails.jobInfo.salary,
              jobType: appDetails.jobInfo.jobType,
              duration: appDetails.jobInfo.duration,
              deadline: appDetails.jobInfo.deadline,
              deadLineValue: appDetails.jobInfo.deadLineValue,
            ),
            appDetails.status,
            appDetails.appliedOn,
            appDetails.profileCompletion,
            statusList: appDetails.statusList,
          ),
          onTap: () {},
        ),
        // Status
        Column(
          spacing: 4,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Status :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0XFF464F5D),
                ),
              ),
            ),
            Column(
              children: [
                ...appDetails.statusList.map(
                  (s) => Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                    child: BulletText(
                      text: s,
                      fontSize: 12,
                      fontColor: 0XFF9192A3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Complete Files
        appDetails.profileCompletion
            ?
              //if profile completed
              Column(
                spacing: 16,
                children: [
                  Alertbox(
                    backgroundColor: 0XFFF6DCDD,
                    borderColor: 0XFFFF6369,
                    textContent: [
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
                    ],
                    svgIcon: "assets/icons/close-circle.svg",
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF1C9F80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Text(
                          "Complete Files",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            :
              //else
              Column(
                spacing: 16,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF1C9F80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Text(
                          appDetails.status == ApplicationStatus.REJECTED
                              ? "See Offers"
                              : "Done",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  if (appDetails.status == ApplicationStatus.PENDING)
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel Application",
                        style: TextStyle(
                          color: Color(0XFFF6454C),
                          fontSize: 16,
                        ),
                      ),
                    ),
                ],
              ),
      ],
    );
  }
}
