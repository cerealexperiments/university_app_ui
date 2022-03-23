import 'package:flutter/material.dart';
import 'package:univercity_app/pages/new_post_page.dart';
import 'package:univercity_app/app_widgets/sort_by_card.dart';

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
        dateCreated: "3/22/2022"),
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
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostPage()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Text(
                        "Добавить",
                        style: appTextStyle(14),
                      ),
                    ),
                    const Expanded(
                      child: Icon(
                        Icons.add_box_outlined,
                        size: 20,
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


class TaskCard extends StatefulWidget {
  TaskCard(
      {required this.taskTopic,
      required this.taskDescription,
      required this.dateCreated});

  final String taskTopic;
  final String taskDescription;
  final String dateCreated;
  String taskState = "Новое";

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
                margin: const EdgeInsets.only(left: 70),
                child: Text(
                  "3/22/2022",
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
              Container(
                width: 100,
                alignment: Alignment.bottomLeft,
                height: 50,
                child: DropdownButton<String>(
                  value: widget.taskState,
                  items: const [
                    DropdownMenuItem(
                      child: Text(
                        "Новое",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                      value: "Новое",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "В прогрессе",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                      value: "В прогрессе",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Сделано",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      value: "Сделано",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      widget.taskState = value!;
                    });
                  },
                ),
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
                  ):null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
