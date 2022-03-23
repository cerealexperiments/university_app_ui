import 'package:flutter/material.dart';

TextStyle appTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
  );
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