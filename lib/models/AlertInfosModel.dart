import 'dart:ui';

class AlertInfosModel {
  final String imagePath;
  final String title ;
  final String description;
  //final String buttonText;
  final List<Map<String,dynamic>> buttonList;
  final Color alertColor;

  AlertInfosModel({required this.imagePath,required this.title,required this.description,/*required this.buttonText,*/ required this.alertColor, required this.buttonList});


}