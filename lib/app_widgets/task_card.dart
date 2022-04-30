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
    if (widget.taskDescription.length > 85) {
      needToExpand = true;
      firstHalf = widget.taskDescription.substring(0, 85) + "...";
      secondHalf = widget.taskDescription.substring(86, widget.taskDescription.length);
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
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Тема: ${widget.taskTopic}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.dateCreated,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
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