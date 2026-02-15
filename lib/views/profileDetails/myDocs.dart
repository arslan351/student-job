import 'package:flutter/material.dart';
import 'package:student_jobs/views/my_profile/widgets/Section.dart';

class MyDocs extends StatelessWidget {
  const MyDocs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 12,
        children : [
          SizedBox(height: 8,),
          Section(title: "ID Card", status: "Click to re-upload", statusLogo: {
            "path" :"assets/icons/verified.svg" , "color" : Color(0XFF32B942)
          }, sectionLogo: "assets/icons/personalcard.svg", onTap: (){}),
          Section(title: "ID Card", status: "Click to re-upload", statusLogo: {
            "path" :"assets/icons/verified.svg" , "color" : Color(0XFF32B942)
          }, sectionLogo: "assets/icons/personalcard.svg", onTap: (){}),
          Section(title: "ID Card", status: "Click to re-upload", statusLogo: {
            "path" :"assets/icons/verified.svg" , "color" : Color(0XFF32B942)
          }, sectionLogo: "assets/icons/personalcard.svg", onTap: (){})
        ]
      ),
    );
  }
}
