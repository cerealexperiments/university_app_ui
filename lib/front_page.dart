import 'package:flutter/material.dart';

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

void main() {
  runApp(TasksListPage());
}

class TasksListPage extends StatefulWidget {
  @override
  State<TasksListPage> createState() => _TasksListPageState();
}

class _TasksListPageState extends State<TasksListPage> {
  List<Widget> tasks = [
    TaskCard(
        taskTopic: "Поменять лампочку",
        taskDescription:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        taskDeadline: "8ч."),
  ];

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
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Добавить",
                    style: appTextStyle(14),
                  ),
                  const Icon(
                    Icons.add_box_outlined,
                    size: 20,
                  ),
                ],
              ),
            ), // Add new task button
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
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  TaskCard(
      {required this.taskTopic,
      required this.taskDescription,
      required this.taskDeadline});

  final String taskTopic;
  final String taskDescription;
  final String taskDeadline;

  @override
  State<TaskCard> createState() => _TaskCardState();
}


class _TaskCardState extends State<TaskCard> {
  late String firstHalf;
  late String secondHalf;
  bool needToExpand = false;
  bool flag = true;
  bool expand = true;
  @override
  void initState(){
    super.initState();
    if (widget.taskDescription.length > 150) {
      needToExpand = true;
      firstHalf = widget.taskDescription.substring(0, 150) + "...";
      secondHalf = widget.taskDescription.substring(151, widget.taskDescription.length);
    }
    else {
      needToExpand = false;
      firstHalf = widget.taskDescription;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
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
                "Тема: ${widget.taskTopic}",
                style: appTextStyle(14),
              ),
              Container(
                margin: const EdgeInsets.only(left: 88),
                child: Text(
                  "срок: ${widget.taskDeadline}",
                  style: appTextStyle(14),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: secondHalf.length==""?Text(
              widget.taskDescription,
              style: appTextStyle(10),
            ):Text(
              flag? firstHalf:widget.taskDescription,
            ),
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  StatusTitle(statusTitle.inProgress),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 30,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    flag = !flag;
                    expand = !expand;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 125),
                  child: needToExpand==true?Row(
                    children: <Widget>[
                      expand==true?Text(
                        "Развернуть",
                        style: appTextStyle(12),
                      ):Text(
                        "Свернуть",
                        style: appTextStyle(12),
                      ),
                      expand==true?const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 30,
                      ):const Icon(
                        Icons.keyboard_arrow_up_sharp,
                        size: 30,
                      ),
                    ],
                  ):const SizedBox(
                    width: 0,
                    height: 0,
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
