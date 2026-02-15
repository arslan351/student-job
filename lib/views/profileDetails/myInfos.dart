import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Myinfos extends StatefulWidget {
  const Myinfos({super.key});

  @override
  State<Myinfos> createState() => _MyinfosState();
}

class _MyinfosState extends State<Myinfos> {
  String genderValue = "Gender";
  String studyValue = "Study";
  DateTime? selectedDate;
  String formattedDate = "Birthday";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0XFFF0A14A), // Your orange color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = "${picked.day.toString().padLeft(2, '0')}/"
            "${picked.month.toString().padLeft(2, '0')}/"
            "${picked.year}";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //upload avatar
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Color(0XFFDBDBDB)),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/profile.svg",
                        width: 50,
                        colorFilter: ColorFilter.mode(
                          Color(0XFF9192A3),
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        "Upload Avatar",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color(0x80262430),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //name
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Left section (icon + label) - fixed width
                    SizedBox(
                      width: 120,
                      child: Row(
                        spacing: 6,
                        children: [
                          SvgPicture.asset(
                            width: 20,
                            "assets/icons/profile.svg",
                            colorFilter: ColorFilter.mode(
                              Color(0XFFF0A14A),
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF262430),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Middle section - expands
                    Expanded(
                      child: Text(
                        "Areslane KACED",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0x80262430),
                        ),
                      ),
                    ),

                    // Right section - fixed width
                    SizedBox(
                      width: 24, // Fixed width for icons
                      child: SvgPicture.asset("assets/icons/verified.svg", colorFilter: ColorFilter.mode(Color(0XFF32B942), BlendMode.srcIn),),
                    ),
                  ],
                ),
              ),
            ),

            //gender
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 12.0,
                ),
                child: Row(
                  children: [
                    // Left section - fixed width
                    SizedBox(
                      width: 120,
                      child: Row(
                        spacing: 6,
                        children: [
                          genderValue == "Male"
                              ? Icon(
                            size: 20,
                            Icons.male_rounded,
                            color: Color(0XFFF0A14A),
                          )
                              : genderValue == "Female"
                              ? Icon(
                            size: 20,
                            Icons.female_rounded,
                            color: Color(0XFFF0A14A),
                          )
                              : Icon(
                            size: 20,
                            Icons.sentiment_neutral_rounded,
                            color: Color(0XFFF0A14A),
                          ),
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF262430),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Middle section - expands
                    Expanded(
                      child: DropdownMenu<String>(
                        textStyle: TextStyle(fontSize: 14),
                        inputDecorationTheme: InputDecorationTheme(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                        initialSelection: genderValue,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: "Gender", label: "Gender"),
                          DropdownMenuEntry(value: "Male", label: "Male"),
                          DropdownMenuEntry(value: "Female", label: "Female"),
                        ],
                        onSelected: (value) {
                          setState(() {
                            genderValue = value!;
                          });
                        },
                      ),
                    ),

                    // Right section - fixed width
                    SizedBox(
                      width: 24,
                      child: (genderValue != "Female") && (genderValue != "Male")
                          ? SvgPicture.asset("assets/icons/unverified.svg", colorFilter: ColorFilter.mode(Color(0XFFF6454C), BlendMode.srcIn),)
                          : SvgPicture.asset("assets/icons/verified.svg", colorFilter: ColorFilter.mode(Color(0XFF32B942), BlendMode.srcIn),),
                    ),
                  ],
                ),
              ),
            ),

            //birthday
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 12.0,
                ),
                child: Row(
                  children: [
                    // Left section - fixed width
                    SizedBox(
                      width: 120,
                      child: Row(
                        spacing: 6,
                        children: [
                          SvgPicture.asset("assets/icons/cake.svg",width: 20,colorFilter: ColorFilter.mode(Color(0XFFF0A14A), BlendMode.srcIn),),
                          Text(
                            "Birthday",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF262430),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Middle section - expands (clickable date picker)
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            formattedDate,
                            style: TextStyle(
                              fontSize: 14,
                              color: formattedDate == "Birthday"
                                  ? const Color(0x80262430) // Lighter color for hint
                                  : const Color(0XFF262430), // Dark color for selected date
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Right section - fixed width
                    SizedBox(
                      width: 24,
                      child:
                      (formattedDate == "Birthday" ? SvgPicture.asset("assets/icons/unverified.svg", colorFilter: ColorFilter.mode(Color(0XFFF6454C), BlendMode.srcIn),)
                          :SvgPicture.asset("assets/icons/verified.svg", colorFilter: ColorFilter.mode(Color(0XFF32B942), BlendMode.srcIn),)
                      ),

                    ),
                  ],
                ),
              ),
            ),

            //study
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 0.0,
                ),
                child: Row(
                  children: [
                    // Left section - fixed width
                    SizedBox(
                      width: 120,
                      child: Row(
                        spacing: 6,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/teacher.svg",
                            width: 20,
                          ),
                          Text(
                            "Study Level",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF262430),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Middle section - expands
                    Expanded(
                      child: DropdownMenu<String>(
                        initialSelection: studyValue,
                        textStyle: const TextStyle(fontSize: 14),
                        inputDecorationTheme: const InputDecorationTheme(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: "Study",
                            label: "Study",
                          ),
                          DropdownMenuEntry(
                            value: "Undergraduate",
                            label: "Undergraduate",
                          ),
                          DropdownMenuEntry(
                            value: "Graduate",
                            label: "Graduate",
                          ),
                        ],
                        onSelected: (value) {
                          setState(() {
                            studyValue = value!;
                          });
                        },
                      ),
                    ),

                    // Right section - fixed width
                    SizedBox(
                      width: 24,
                      child: SvgPicture.asset("assets/icons/verified.svg",colorFilter: ColorFilter.mode(Color(0XFF32B942), BlendMode.srcIn),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
