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

class FrontPage extends StatefulWidget {
  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {

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
      body: Column(
        children: <Widget>[
          Container(
            width: 150,
            height: 26,
            margin: const EdgeInsets.fromLTRB(0, 60, 185, 40),
            child: const Text(
              "Список задач",
              style: TextStyle(
                fontFamily: "fonts/Lato-Regular.ttf",
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          Container(
              width: 350,
              height: 30,
              margin: const EdgeInsets.fromLTRB(22, 0, 22, 30),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 320),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              )), // SearchBar
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
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(
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
    );
  }
}



