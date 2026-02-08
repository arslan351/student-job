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
        preferredSize: const Size.fromHeight(120),
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
                              const SnackBar(content: Text("Menu button clicked")),
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

      body: const Center(
        child: Text("Welcome to Home!", style: TextStyle(fontSize: 24)),
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
                  Text("Jobs",style: TextStyle(fontWeight: FontWeight.bold,fontSize :10 ,color: Color(0XFF1C9F80)),)
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
                  Text("My Applications",style: TextStyle(fontWeight: FontWeight.bold,fontSize :10 ,color: Color(0xB2262430)),)
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
                  Text("My shifts",style: TextStyle(fontWeight: FontWeight.bold,fontSize :10 ,color: Color(0xB2262430)),)
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
                  Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize :10 ,color: Color(0xB2262430)),)
                ],
              ),
            ],
          ),
        ),
      ),



    );
  }
}
