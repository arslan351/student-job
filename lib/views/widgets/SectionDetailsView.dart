import 'package:flutter/material.dart';
import 'package:student_jobs/views/profileDetails/myDocs.dart';
import 'package:student_jobs/views/profileDetails/myFavJob.dart';
import 'package:student_jobs/views/profileDetails/myInfos.dart';
import 'package:student_jobs/views/profileDetails/myPreference.dart';
import 'package:student_jobs/views/profileDetails/mySupport.dart';
import 'package:student_jobs/views/widgets/AppBar.dart';

class SectionDetailsView extends StatefulWidget {
  final String title ;

  const SectionDetailsView({super.key, required this.title,});

  @override
  State<SectionDetailsView> createState() => _SectionDetailsViewState();
}

class _SectionDetailsViewState extends State<SectionDetailsView> {
  final Map<String , Widget> contentMap = {
    'Informations': Myinfos(),
    'Documents' : MyDocs(),
    'My Favorites Jobs' : MyFavJob(),
    'My Preferences' : MyPreference(),
    'My Support' : MySupport(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarContent: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text(
                widget.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: contentMap[widget.title] ?? Center(child: Text('No content '))


    );
  }
}

