import 'package:flutter/material.dart';
import 'package:univercity_app/pages/tasks_page.dart';

void main() {
  runApp(UniversityAppUI());
}
//dooooo

class UniversityAppUI extends StatelessWidget {
  const UniversityAppUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "fonts/Lato-Regular.ttf",
      ),
      debugShowCheckedModeBanner: false,
      home: TasksPage(), // произвел изменения, далее переход из main --> в KitchenPage
    );
  }
}
