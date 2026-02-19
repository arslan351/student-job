import 'package:flutter/material.dart';
import 'package:student_jobs/models/CardModel.dart';
import 'package:student_jobs/models/JobDetailsModel.dart';
import 'package:student_jobs/views/my_jobs/widgets/JobDetailsBottomSheet.dart';
import 'package:student_jobs/views/my_jobs/widgets/jobCard.dart';
import 'package:student_jobs/views/widgets/BottomSheetModel.dart';

class MyFavJob extends StatefulWidget {
  const MyFavJob({super.key});

  @override
  State<MyFavJob> createState() => _MyFavJobState();
}

class _MyFavJobState extends State<MyFavJob> {

  List<CardModel> cardsDto = [];

  List<JobDetailsModel> jobsDetails = [];

  List<String> qualifications = [];

  @override
  void initState(){
    super.initState();

    cardsDto = [
      CardModel(
        logoPath: "assets/icons/Logo_Djezzy_cmp.svg",
        title: "Vendeur Boutique Djezzy",
        location: "Alger - Bab Ezzouar",
        salary: "45 000 DZ / Mois",
        jobType: "Part-time",
        duration: "6 Months",
        deadline: "Deadline : ",
        deadLineValue: "20 Sept",
      ),
      CardModel(
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
      JobDetailsModel(card: cardsDto[0], qualifications: ["Minimum: Baccalauréat (high school diploma) or equivalent." , "Preferred: Degree or training in Commerce, Marketing, or related field...",], profileCompletion: false),
      JobDetailsModel(card: cardsDto[1], qualifications: ["Minimum: Baccalauréat (high school diploma) or equivalent." , "Preferred: Degree or training in Commerce, Marketing, or related field..."],profileCompletion : true),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 12,
        children:
        jobsDetails.asMap().entries.map((jobDetailMap){
          final CardModel card = jobDetailMap.value.card;
          final List<String> qualifications = jobDetailMap.value.qualifications;
          final bool profileCompletion = jobDetailMap.value.profileCompletion ;
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
                    final jobDetailsModel = JobDetailsModel(card: card, qualifications: qualifications,profileCompletion: profileCompletion);
                    return BottomSheetModel(child: JobDetailsBottomSheet(jobDetails: jobDetailsModel));
                  },
                );

              }
          );
        }).toList(),
      ),
    );
  }
}
