import 'package:flutter/material.dart';
import 'package:univercity_app/pages/section_page.dart';
import 'app_widgets/section_card.dart';

void main() {
  runApp(UniversityAppUI());
}

class UniversityAppUI extends StatelessWidget {
  const UniversityAppUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "fonts/Lato-Regular.ttf",
      ),
      debugShowCheckedModeBanner: false,
      home: SectionPage(),
    );
  }
}
