import "package:flutter/material.dart";

import 'front_page.dart';

void main() {
  runApp(NewPostPage());
}

class NewPostPage extends StatefulWidget {
  String taskDeadline = "5ч.";
  String dateCreated = "3/22/2022";
  String taskState = "Новое";

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(30, 60, 0, 40),
            width: 400,
            height: 30,
            child: const Text(
              "Добавить задачу",
              style: TextStyle(
                fontFamily: "fonts/Lato-Regular.ttf",
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 40),
              width: 200,
              height: 30,
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "тема",
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 40),
              width: 200,
              height: 40,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "описание",
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "создано: ${widget.dateCreated}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 40),
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
              SizedBox(
                width: 100,
              ),
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
                    print("post has been added");
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
