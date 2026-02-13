import 'package:flutter/material.dart';

class BottomSheetModel extends StatelessWidget {
  final Widget child ;

  const BottomSheetModel({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFF6F7FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            // Drag handle
            Container(
              width: 58,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color(0XFFD9D9D9),
              ),
            ),
            // Content
            child
          ],
        ),
      ),
    );
  }
}
