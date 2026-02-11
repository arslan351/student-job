import 'package:flutter/material.dart';
import 'package:student_jobs/models/JobDetails.dart';
import 'package:student_jobs/views/home/widgets/card/card.dart';
import 'package:student_jobs/views/widgets/BulletText.dart';

class JobDetailsBottomSheet extends StatelessWidget {
  final JobdetailsModel jobdetails;

  const JobDetailsBottomSheet({super.key, required this.jobdetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFF6F7FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            // Drag handle
            Container(
              width: 58,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color(0XFFD9D9D9),
              ),
            ),
            //const SizedBox(height: 16),
            // Card
            CardJob(
              assetLogo: jobdetails.card.logoPath,
              title: jobdetails.card.title,
              location: jobdetails.card.location,
              salary: jobdetails.card.salary,
              jobType: jobdetails.card.jobType,
              duration: jobdetails.card.duration,
              deadline: jobdetails.card.deadline,
              deadLineValue: jobdetails.card.deadLineValue,
              onTap: () {},
            ),
            //const SizedBox(height: 16),
            // Qualifications
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Qualifications :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0XFF464F5D),
                ),
              ),
            ),
            //const SizedBox(height: 8),
            Column(
              children: [
                ...jobdetails.qualifications.map(
                      (q) => Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                    child: BulletText(text: q, fontSize: 12, fontColor: 0XFF9192A3),
                  ),
                ),
              ],
            ),
            // Apply buttons
            Column(
              children: [
                // View More Info
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View More Info",
                    style: TextStyle(color: Color(0XFF464F5D), fontSize: 12),
                  ),
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
                        "Apply Now",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
