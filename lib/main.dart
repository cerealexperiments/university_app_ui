import 'package:flutter/material.dart';
import 'pages/front_page.dart';

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
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 40,
                  margin: EdgeInsets.only(left: 40, top: 50),
                  child: Text(
                    "Категория",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 125, top: 52),
                  child: Image.asset(
                    "icons/info.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
