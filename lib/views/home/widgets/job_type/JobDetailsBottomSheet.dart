import 'package:flutter/cupertino.dart';
import 'package:student_jobs/models/JobDetails.dart';
import 'package:student_jobs/views/home/widgets/card/card.dart';

class JobDetailsBottomSheet extends StatelessWidget {
  final JobdetailsModel jobdetails;

  const JobDetailsBottomSheet({super.key, required this.jobdetails});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0XFFF6F7FC),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //dragging button (just for visuals)
                Container(
                  width: 58,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Color(0XFFD9D9D9),
                  ),
                  child: MouseRegion(cursor: SystemMouseCursors.click),
                ),
                //card
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,16,0,16),
                  child: CardJob(
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
                ),
                Row(
                  children: [
                    Text("Qualifications :" , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0XFF464F5D),
                    ),)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
