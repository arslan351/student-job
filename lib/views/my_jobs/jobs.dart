import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/JobDetails.dart';
import 'package:student_jobs/views/my_jobs/widgets/job_type/job_type.dart';
import 'package:student_jobs/views/my_jobs/widgets/card/card.dart';
import 'package:student_jobs/models/JobFilter.dart';
import 'package:student_jobs/models/Card.dart';
import 'package:student_jobs/views/my_jobs/widgets/job_type/JobDetailsBottomSheet.dart';
import 'package:student_jobs/views/widgets/BottomSheetModel.dart';

class JobsView extends StatefulWidget {
  const JobsView({super.key});

  @override
  State<JobsView> createState() => _JobsView();
}

class _JobsView extends State<JobsView> {
  List<JobFilter> jobTypes = [];
  List<CardDto> cardsDto = [];
  List<JobdetailsModel> jobsDetails = [];
  List<String> qualifications = [];

  @override
  void initState() {
    super.initState();

    jobTypes = [
      JobFilter(isClicked: true, svgPath: "assets/icons/bolt.svg", title: "For You"),
      JobFilter(isClicked: false, svgPath: "assets/icons/monitor.svg", title: "IT"),
      JobFilter(isClicked: false,svgPath: "assets/icons/call-calling.svg",title: "Support",),
      JobFilter(isClicked: false,svgPath: "assets/icons/chart.svg",title: "Marketing",),
      JobFilter(isClicked: false,svgPath: "assets/icons/shopping-bag.svg",title: "Commerce",),
    ];

    cardsDto = [
      CardDto(
        logoPath: "assets/icons/Logo_Djezzy_cmp.svg",
        title: "Vendeur Boutique Djezzy",
        location: "Alger - Bab Ezzouar",
        salary: "45 000 DZ / Mois",
        jobType: "Part-time",
        duration: "6 Months",
        deadline: "Deadline : ",
        deadLineValue: "20 Sept",
      ),
      CardDto(
        logoPath: "assets/icons/poste-algerie-cmp.svg",
        title: "IT Support  Algeria Telecom",
        location: "Alger - Bab Ezzouar",
        salary: "Hided",
        jobType: "Part-time",
        duration: "6 Months",
        deadline: "Deadline : ",
        deadLineValue: "20 Sept",
      ),
    ];

    jobsDetails = [
      JobdetailsModel(card: cardsDto[0], qualifications: ["Minimum: Baccalauréat (high school diploma) or equivalent." , "Preferred: Degree or training in Commerce, Marketing, or related field..."]),
      JobdetailsModel(card: cardsDto[1], qualifications: ["Minimum: Baccalauréat (high school diploma) or equivalent." , "Preferred: Degree or training in Commerce, Marketing, or related field..."]),
    ];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //title
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 166,
                  child: Text.rich(
                    TextSpan(
                      text: "Find Your Perfect ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF464F5D),
                      ),
                      children: [
                        TextSpan(
                          text: "JOB",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF1C9F80),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //job types
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Row(
                    spacing: 14.0,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: jobTypes.asMap().entries.map((entry) {
                      final index = entry.key;
                      final jobType = entry.value;

                      return JobType(
                        isClicked: jobType.isClicked,
                        svgAssetPicture: jobType.svgPath,
                        title: jobType.title,
                        onTap: () {
                          setState(() {
                            for (final jt in jobTypes) {
                              jt.isClicked = false;
                            }
                            jobTypes[index].isClicked = true;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              //filter
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/document-filter.svg",
                            width: 20,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF1C9F80),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 18,
                            color: Color(0XFF26243066),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: 'Add Filter',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //cards
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 16,
                  children:
                    jobsDetails.asMap().entries.map((jobDetailMap){
                      final CardDto card = jobDetailMap.value.card;
                      final List<String> qualifications = jobDetailMap.value.qualifications;
                      return CardJob(
                          assetLogo: card.logoPath ,
                          title: card.title,
                          location: card.location,
                          salary: card.salary,
                          jobType: card.jobType,
                          duration: card.duration,
                          deadline: card.deadline,
                          deadLineValue: card.deadLineValue,
                          onTap :(){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                final jobDetails = JobdetailsModel(card: card, qualifications: qualifications,);
                                return BottomSheetModel(child: JobDetailsBottomSheet(jobDetails: jobDetails));
                              },
                            );

                          }
                      );
                    }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
