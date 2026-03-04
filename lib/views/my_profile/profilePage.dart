import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_jobs/models/AlertInfosModel.dart';
import 'package:student_jobs/models/SectionModel.dart';
import 'package:student_jobs/providers/authProvider.dart';
import 'package:student_jobs/views/login/login.dart';
import 'package:student_jobs/views/my_profile/widgets/Section.dart';
import 'package:student_jobs/views/widgets/AlertPopup.dart';
import 'package:student_jobs/views/widgets/SectionDetailsView.dart';

class MyProfileView extends ConsumerStatefulWidget {
  const MyProfileView({super.key});
  @override
  ConsumerState<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends ConsumerState<MyProfileView> {
  String assetsPath = "assets/icons/";
  List<SectionModel> sections = [];
  bool isAutoEntrepreneur = false;

  @override
  void initState() {
    super.initState();

    sections = [
      SectionModel("Informations ", "Completed", {
        "path": assetsPath + "verified.svg",
        "color": Color(0XFF32B942),
      }, sectionLogo: assetsPath + "personalcard.svg"),
      SectionModel("Documents ", "Uploaded", {
        "path": assetsPath + "verified.svg",
        "color": Color(0XFF32B942),
      }, sectionLogo: assetsPath + "personalcard.svg"),
      SectionModel(
        "Auto-Entrepreneur ",
        isAutoEntrepreneur ? "Verified" : "Unverified",
        isAutoEntrepreneur
            ? {"path": assetsPath + "verified.svg", "color": Color(0XFF32B942)}
            : {
                "path": assetsPath + "unverified.svg",
                "color": Color(0XFFF6454C),
              },
        sectionLogo: assetsPath + "personalcard.svg",
      ),
      SectionModel("My Favorites Jobs ", "", {
        "path": "",
        "color": "",
      }, sectionLogo: assetsPath + "archive-tick.svg"),
      SectionModel("My Preferences ", "", {
        "path": "",
        "color": "",
      }, sectionLogo: assetsPath + "setting-3.svg"),
      SectionModel("My Support ", "", {
        "path": "",
        "color": "",
      }, sectionLogo: assetsPath + "double-circle.svg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title
            Align(
              alignment: Alignment.center,
              child: Text(
                "My Profile",
                style: TextStyle(
                  color: Color(0XFF464F5D),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            //profile pic
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            //name and phone
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      "Areslane KACED",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF464F5D),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/verified.svg", width: 20),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "0760451021",
                      style: TextStyle(fontSize: 12, color: Color(0XFF9192A3)),
                    ),
                  ],
                ),
              ],
            ),
            //infos
            ...sections.map((section) {
              return Section(
                title: section.title,
                status: section.statusName,
                statusLogo: section.statusLogo,
                sectionLogo: section.sectionLogo,
                onTap: () {
                  if (section.title.trim() == "Auto-Entrepreneur") {
                    final alertInfosModel = isAutoEntrepreneur
                        ? AlertInfosModel(
                            imagePath: "assets/icons/briefcase.svg",
                            title: 'Auto-Entrepreneur',
                            description:
                                "Congratulations! Your Auto-Entrepreneur profile has been successfully verified.",
                            buttonList: [
                              {"title": "Go Back", "color": Color(0XFF1C9F80)},
                            ],
                            alertColor: Color(0XFF1C9F80),
                          )
                        : AlertInfosModel(
                            imagePath: "assets/icons/briefcase.svg",
                            title: 'Auto-Entrepreneur',
                            description:
                                "In order to apply you should have the auto-entrepreneur card as it is required for the application",
                            buttonList: [
                              {"title": "Go Back", "color": Color(0XFFF0A14A)},
                            ],
                            alertColor: Color(0XFFF0A14A),
                          );
                    return _showDialog(context, alertInfosModel);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            SectionDetailsView(title: section.title.trim())),
                      ),
                    );
                  }
                },
              );
            }),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      _handleLogout(context, ref);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(14.0),
                        child: Row(
                          spacing: 8,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/Frame.svg",
                              width: 20,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFFE43F3B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      final alertInfosModel = AlertInfosModel(
                        imagePath: "assets/icons/info.svg",
                        title: "Delete Account",
                        description:
                            "This action cannot be undone. All your data will be permanently removed.",
                        buttonList: [
                          {"title": "Cancel", "color": Color(0x669192A3)},
                          {"title": "Confirm", "color": Color(0XFFFFC100)},
                        ],
                        alertColor: Color(0XFFFFC100),
                      );
                      _showDialog(context, alertInfosModel);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(14.0),
                        child: Row(
                          spacing: 8,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/trash.svg",
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "Delete My Account",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0XFF464F5D),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Data privacy and use of terms
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: BoxBorder.all(color: Color(0XFF9192A3)),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(14),
                        child: Row(
                          spacing: 8,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/user-tag.svg",
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                Color(0XFF9192A3),
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              "Data Privacy",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF9192A3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: BoxBorder.all(color: Color(0XFF9192A3)),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(14),
                        child: Row(
                          spacing: 8,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/profile-tick.svg",
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                Color(0XFF9192A3),
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              "Terms of use",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF9192A3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Version 4.3.4.1",
                  style: TextStyle(fontSize: 10, color: Color(0XFF9192A3)),
                ),
                Text(
                  "Djezzy ©2025 All Rights reserved",
                  style: TextStyle(fontSize: 10, color: Color(0XFF9192A3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final alertInfosModel = AlertInfosModel(
      imagePath: "assets/icons/info.svg",
      title: "Log Out",
      description:
          "Are you Sure you want to Logout. you will have to re-enter your phone number",
      buttonList: [
        {"title": "Cancel", "color": Color(0x669192A3), "onPressed": null},
        {
          "title": "Confirm",
          "color": Color(0XFFFFC100),
          "onPressed": () async {
            await ref.read(authStateProvider.notifier).logout();

            if (!context.mounted) return;

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            );

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Logged out')));
          },
        },
      ],
      alertColor: Color(0XFFFFC100),
    );
    _showDialog(context, alertInfosModel);
  }
}

void _showDialog(BuildContext context, AlertInfosModel alertInfosModel) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (BuildContext context) {
      return AlertPopup(alertInfosModel: alertInfosModel);
    },
  );
}
