import 'package:flutter/material.dart';
import 'front_page.dart';
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
        home: FrontPage(),
    );
  }
}
