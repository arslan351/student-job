import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/Action.dart';
import 'package:student_jobs/views/my_jobs/jobsPage.dart';
import 'package:student_jobs/views/my_apps/appsPage.dart';
import 'package:student_jobs/views/my_profile/profilePage.dart';
import 'package:student_jobs/views/my_shifts/myShifts.dart';
import 'package:student_jobs/views/profileDetails/myFavJob.dart';
import 'package:student_jobs/views/widgets/AppBar.dart';
import 'package:student_jobs/views/widgets/SectionDetailsView.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const JobsView(),
    const MyAppsView(),
    const MyShiftsView(),
    const MyProfileView(),
  ];

  List<ActionsDto> actions = [];

  @override
  void initState() {
    super.initState();

    actions = [
      ActionsDto(true, "Jobs", "assets/icons/briefcase.svg"),
      ActionsDto(false, "My Applications", "assets/icons/myapps.svg"),
      ActionsDto(false, "My Shifts", "assets/icons/myshift.svg"),
      ActionsDto(false, "My Profile", "assets/icons/myprofile.svg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF6F7FC),

      //drawer
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
                /*ListTile(
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
                ),*/
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
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedIndex = 3;
                      for (final action in actions) {
                        action.isClicked = false;
                      }
                      actions[3].isClicked = true;
                    });
                  },
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder : (context)=>
                        SectionDetailsView(title: "My Favorites Jobs")) ,
                    );
                  },
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder : (context)=>
                            SectionDetailsView(title: "My Support")) ,
                    );
                  },
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
                  title: Text("My Preferences"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder : (context)=>
                            SectionDetailsView(title: "My Preferences")) ,
                    );
                  },
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

      //app bar
      appBar: MyAppBar(
        appBarContent: Align(
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

                SvgPicture.asset("assets/icons/appBar_logo.svg", width: 50),
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
      ),

      //body
      body: IndexedStack(index: _selectedIndex, children: _pages),

      //bottom nav bar
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 4,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: actions.asMap().entries.map((entry) {
              final int index = entry.key;
              final ActionsDto action = entry.value;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      for (final action in actions) {
                        action.isClicked = false;
                      }
                      actions[index].isClicked = true;
                      _selectedIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                          action.isClicked
                              ? Color(0XFF1C9F80)
                              : Color(0xB2262430),
                          BlendMode.srcIn,
                        ),
                        action.pathLogo,
                        width: 35,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        action.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: action.isClicked
                              ? Color(0XFF1C9F80)
                              : Color(0xB2262430),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
