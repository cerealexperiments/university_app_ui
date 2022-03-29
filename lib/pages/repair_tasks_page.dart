import 'package:flutter/material.dart';
import 'package:univercity_app/pages/new_post_page.dart';
import 'package:univercity_app/app_widgets/sort_by_card.dart';

import '../app_widgets/task_card.dart';

enum statusTitle {
  latest,
  inProgress,
  done,
}

TextStyle appTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
  );
}

Text StatusTitle(statusTitle taskStatus) {
  final String status;
  final Color color;
  if (taskStatus == statusTitle.latest) {
    status = "Новое";
    color = Colors.green;
  } else if (taskStatus == statusTitle.inProgress) {
    status = "В прогрессе";
    color = Colors.blue;
  } else {
    status = "Сделано";
    color = Colors.grey;
  }
  return Text(
    status,
    style: TextStyle(
      color: color,
      fontSize: 12,
    ),
  );
}

class RepairPage extends StatefulWidget {
  @override
  State<RepairPage> createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {

  List<Widget> tasks = [
    TaskCard(
        taskTopic: "Поменять лампочку",
        taskDescription:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        dateCreated: "3/23/2022"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      "icons/arrow-left.png",
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(45, 60, 0, 40),
                  width: 200,
                  height: 30,
                  child: const Text(
                    "Список задач",
                    style: TextStyle(
                      fontFamily: "fonts/Lato-Regular.ttf",
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    "icons/settings.png",
                    width: 55,
                    height: 55,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 40,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SortByCard(
                      cardTitle: "Все",
                      cardColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: SortByCard(
                      cardTitle: "Новое",
                      cardColor: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: SortByCard(
                      cardTitle: "В процессе",
                      cardColor: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: SortByCard(
                      cardTitle: "Сделано",
                      cardColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ), // SortBy
            Column(
              children: tasks,
            ), // Tasks
            Container(
              width: 110,
              height: 35,
              margin: EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      1.0,
                      3.0,
                    ),
                    blurRadius: 4.0,
                    spreadRadius: 0.2,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostPage()));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Добавить",
                        style: appTextStyle(12),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "icons/add.png",
                          width: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), // Add new task button
          ],
        ),
      ),
    );
  }
}