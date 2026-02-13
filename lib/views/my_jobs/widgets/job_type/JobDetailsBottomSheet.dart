import 'package:flutter/material.dart';
import 'package:student_jobs/models/JobDetails.dart';
import 'package:student_jobs/views/my_jobs/widgets/card/card.dart';
import 'package:student_jobs/views/widgets/BulletText.dart';

class JobDetailsBottomSheet extends StatelessWidget {
  final JobdetailsModel jobDetails;

  const JobDetailsBottomSheet({super.key, required this.jobDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        // Card
        CardJob(
          assetLogo: jobDetails.card.logoPath,
          title: jobDetails.card.title,
          location: jobDetails.card.location,
          salary: jobDetails.card.salary,
          jobType: jobDetails.card.jobType,
          duration: jobDetails.card.duration,
          deadline: jobDetails.card.deadline,
          deadLineValue: jobDetails.card.deadLineValue,
          onTap: () {},
        ),
        // Qualifications
        Column(
          spacing: 4,
          children: [
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
            Column(
              children: [
                ...jobDetails.qualifications.map(
                      (q) => Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                    child: BulletText(text: q, fontSize: 12, fontColor: 0XFF9192A3),
                  ),
                ),
              ],
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
    );
  }
}
