import 'package:student_jobs/models/CardModel.dart';

class JobDetailsModel {
  final CardModel card ;
  final List<String> qualifications;
  final bool profileCompletion ;

  const JobDetailsModel({required this.card, required this.qualifications, required this.profileCompletion});
}