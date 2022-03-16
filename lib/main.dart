import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum statusTitle {
  latest,
  inProgress,
  done,
}

TextStyle appTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: "fonts/Lato-Regular.ttf",
  );
}

Text StatusTitle(statusTitle taskStatus) {
  if (taskStatus == statusTitle.latest) {
    return Text(
      "Новое",
      style: TextStyle(
        color: Colors.green,
        fontSize: 12,
        fontFamily: "fonts/Lato-Regular.ttf",
      ),
    );
  } else if (taskStatus == statusTitle.inProgress) {
    return const Text(
      "В прогрессе",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontFamily: "fonts/Lato-Regular.ttf",
      ),
    );
  } else {
    return Text(
      "Сделано",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontFamily: "fonts/Lato-Regular.ttf",
      ),
    );
  }
}

void main() {
  runApp(const TasksListPage());
}

class TasksListPage extends StatelessWidget {
  const TasksListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 26,
                  margin: EdgeInsets.fromLTRB(22, 60, 185, 40),
                  child: Text(
                    "Список задач",
                    style: appTextStyle(20),
                  ),
                ),
                Container(
                  width: 17,
                  height: 17,
                  child: Icon(
                    Icons.edit,
                    size: 17,
                  ),
                ),
              ],
            ),
            Container(
              width: 280,
              height: 15,
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                "Placeholder for search bar",
              ),
            ), //SearchBar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
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
            ), //SortBy
            TaskCard(
                taskTopic: "Поменять лампочку",
                taskDescription:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                taskDeadline: "8ч.")
          ],
        ),
      ),
    );
  }
}

class SortByCard extends StatelessWidget {
  SortByCard({required this.cardTitle, required this.cardColor});

  final Color cardColor;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 120,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          cardTitle,
          style: TextStyle(
            color: cardColor,
            fontSize: 12,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  TaskCard({required this.taskTopic,
    required this.taskDescription,
    required this.taskDeadline});

  final String taskTopic;
  final String taskDescription;
  final String taskDeadline;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Text(
                "Тема: $taskTopic",
                style: appTextStyle(14),
              ),
              Container(
                margin: const EdgeInsets.only(left: 80),
                child: Text(
                  "срок: $taskDeadline",
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              taskDescription,
              style: appTextStyle(10),
            ),
          ),
          Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    StatusTitle(statusTitle.inProgress),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 30,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 125),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Развернуть",
                        style: appTextStyle(12),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ],
      ),
    );
  }
}
