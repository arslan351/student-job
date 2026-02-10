import 'package:student_jobs/models/Card.dart';

class JobdetailsModel {
  final CardDto card ;
  final List<String> qualifications;

  const JobdetailsModel({required this.card, required this.qualifications});
}