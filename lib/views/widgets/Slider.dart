import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const MySlider({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isSelected);
      },
      child: Container(
        width: 50,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Color(0XFF2EC65D) : Colors.grey[300],
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 150),
          alignment: isSelected ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}