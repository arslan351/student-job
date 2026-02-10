import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/JobDetails.dart';
import 'package:student_jobs/views/home/widgets/job_type/job_type.dart';
import 'package:student_jobs/views/home/widgets/card/card.dart';
import 'package:student_jobs/models/Job.dart';
import 'package:student_jobs/models/Card.dart';
import 'package:student_jobs/views/home/widgets/job_type/JobDetailsBottomSheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Job> jobTypes = [];
  List<CardDto> cardsDto = [];

  @override
  void initState() {
    super.initState();

    jobTypes = [
      Job(isClicked: true, svgPath: "assets/icons/bolt.svg", title: "For You"),
      Job(isClicked: false, svgPath: "assets/icons/monitor.svg", title: "IT"),
      Job(
        isClicked: false,
        svgPath: "assets/icons/call-calling.svg",
        title: "Support",
      ),
      Job(
        isClicked: false,
        svgPath: "assets/icons/chart.svg",
        title: "Marketing",
      ),
      Job(
        isClicked: false,
        svgPath: "assets/icons/shopping-bag.svg",
        title: "Commerce",
      ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0XFFF6F7FC),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.0,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    "assets/icons/sidebar-left.svg",
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      Color(0XFF9192A3),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: SvgPicture.asset(
                    "assets/icons/Avatar.svg",
                    width: 24,
                  ),
                  title: Text("07 79 79 46 28"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    width: 24,
                  ),
                  title: Text("My Profile"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: SvgPicture.asset(
                    "assets/icons/archive-tick.svg",
                    width: 24,
                  ),
                  title: Text("My Favorite Jobs"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: SvgPicture.asset(
                    "assets/icons/double-circle.svg",
                    width: 24,
                  ),
                  title: Text("My Support"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: SvgPicture.asset(
                    "assets/icons/setting-3.svg",
                    width: 24,
                  ),
                  title: Text("My Preference"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: SvgPicture.asset(
                    "assets/icons/Frame.svg",
                    width: 24,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Color(0XFFE43F3B)),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0XFFF6F7FC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Stack(
              children: [
                // Linear gradient
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF27A99A), Color(0xFF19363A)],
                    ),
                  ),
                ),
                // Bubbles SVG
                Positioned.fill(
                  child: SvgPicture.asset(
                    "assets/icons/background_bubbles.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                // Centered logo + buttons
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),

                        SvgPicture.asset(
                          "assets/icons/appBar_logo.svg",
                          width: 50,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 6),
                            Icon(Icons.notifications_none, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

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
                  children: cardsDto.asMap().entries.map((entry){
                    final index = entry.key;
                    final card = entry.value;
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
                              final qualifications= ["Minimum: Baccalauréat (high school diploma) or equivalent.","Preferred: Degree or training in Commerce, Marketing, or related field..."];
                              final jobDetails = JobdetailsModel(card: card, qualifications: qualifications);
                              return JobDetailsBottomSheet(jobdetails: jobDetails);
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

      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 4,
        child: SizedBox(
          height: 80, // enough height for SVG
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/briefcase.svg",
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Jobs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0XFF1C9F80),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/myapps.svg",
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "My Applications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xB2262430),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/myshift.svg",
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "My shifts",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xB2262430),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/myprofile.svg",
                    width: 35,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xB2262430),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
