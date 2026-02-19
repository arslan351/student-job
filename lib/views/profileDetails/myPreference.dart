import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/views/widgets/Slider.dart';

class MyPreference extends StatefulWidget {
  const MyPreference({super.key});

  @override
  State<MyPreference> createState() => _MyPreferenceState();
}

class _MyPreferenceState extends State<MyPreference> {
  bool isDarkMode = false;
  bool isNotifActive =false;

  String languageValue ="English";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 12,
        children: [
          SizedBox(height: 8,),
          //light-dark mode
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side with icon and text
                  Row(
                    children: [
                      isDarkMode ? SvgPicture.asset("assets/icons/moon.svg",width: 24,) : SvgPicture.asset("assets/icons/sun.svg",width: 24,),
                      SizedBox(width: 8),
                      Text(
                        "Appearance",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF262430),
                        ),
                      ),
                    ],
                  ),
                  // Right side with switch
                  MySlider(isSelected: isDarkMode,
                    onChanged: (newValue) {
                      setState(() {
                        isDarkMode = newValue;
                      });
                    },),
                ],
              ),
            ),
          ),
          //language
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,4,0,4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side with icon and text
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/translate.svg",width: 24,),
                      SizedBox(width: 8),
                      Text(
                        "Language",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF262430),
                        ),
                      ),
                    ],
                  ),
                  // Right side dropdown
                  SizedBox(width: 120,
                    child: DropdownMenu<String>(
                      textStyle: TextStyle(fontSize: 14),
                      inputDecorationTheme: InputDecorationTheme(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                      initialSelection: languageValue,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: "English", label: "English"),
                        DropdownMenuEntry(value: "Français", label: "Français"),
                        DropdownMenuEntry(value: "Arabe", label: "Arabe"),
                      ],
                      onSelected: (value) {
                        setState(() {
                          languageValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //notifications
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side with icon and text
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/notification-bell.svg",width: 24,),
                      SizedBox(width: 8),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF262430),
                        ),
                      ),
                    ],
                  ),
                  // Right side with switch
                  MySlider(isSelected: isNotifActive,
                    onChanged: (newValue) {
                      setState(() {
                        isNotifActive = newValue;
                      });
                    },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}