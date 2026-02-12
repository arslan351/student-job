import 'package:flutter/material.dart';
import 'package:student_jobs/models/Card.dart';
import 'package:student_jobs/models/Enums/ApplicationStatus.dart';

class MyApplicationModel {
  final CardDto jobInfo;
  //final Map<String, Object> status;
  final ApplicationStatus status;
  final DateTime appliedOn;

  MyApplicationModel(this.jobInfo, this.status, this.appliedOn);

  Map<String, Object> getStatus() {
    switch (status) {
      case ApplicationStatus.PENDING:
        return {"color": Color(0XFFFFC505), "name": "Under Review"};

      case ApplicationStatus.APPROVED:
        return {"color": Color(0XFF32B942), "name": "Accepted"};

      case ApplicationStatus.REJECTED:
        return {"color": Color(0XFFF6454C), "name": "Rejected"};

      case ApplicationStatus.INTERVIEW:
        return {"color": Colors.blue, "name": "Interview"};
    }
  }
}
