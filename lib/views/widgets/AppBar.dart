import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget appBarContent;

  const MyAppBar({super.key, required this.appBarContent});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
              appBarContent
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
