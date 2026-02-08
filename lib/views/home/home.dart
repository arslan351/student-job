import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
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
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Menu button clicked"),
                              ),
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

      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF27A99A), Color(0xFF19363A)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        10,
                        0,
                        10,
                      ), //20,10,20,10
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/bolt.svg", width: 34),
                          SizedBox(height: 8),
                          Text(
                            "For You",
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        10,
                        0,
                        10,
                      ), //20,10,20,10
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/monitor.svg",
                            width: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "IT",
                            style: TextStyle(
                              color: Color(0xFF262430),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        10,
                        0,
                        10,
                      ), //20,10,20,10
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/call-calling.svg",
                            width: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Support",
                            style: TextStyle(
                              color: Color(0xFF262430),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        10,
                        0,
                        10,
                      ), //20,10,20,10
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/chart.svg", width: 34),
                          SizedBox(height: 8),
                          Text(
                            "Marketing",
                            style: TextStyle(
                              color: Color(0xFF262430),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        10,
                        0,
                        10,
                      ), //20,10,20,10
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/shopping-bag.svg",
                            width: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Commerce",
                            style: TextStyle(
                              color: Color(0xFF262430),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                        Text("Filter", style: TextStyle(fontSize: 12,color: Color(0XFF1C9F80))),
                        Container(
                          width: 1,
                          height: 18,
                          color: Color(0XFF26243066),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.grey,
                        ),
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
          ],
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
