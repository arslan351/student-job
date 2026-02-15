class SectionModel {
  final String sectionLogo;
  final String title;
  final String statusName;
  final Map<String,dynamic> statusLogo;

  SectionModel(this.title, this.statusName, this.statusLogo, {required this.sectionLogo});
}