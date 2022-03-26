import "package:flutter/material.dart";

import '../app_widgets/task_card.dart';


class NewPostPage extends StatefulWidget {
  String taskDeadline = "5ч.";
  String taskState = "Новое";

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 450,
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
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 10),
                    child: Image.asset(
                      "icons/arrow-left.png",
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 60, 0, 40),
                  width: 200,
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
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                width: 200,
                height: 30,
                child: const TextField(
                  decoration: InputDecoration(
                    filled: false,
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
                margin: EdgeInsets.only(left: 30),
                width: 200,
                height: 40,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "описание",
                    hintStyle: TextStyle(
                      fontSize: 15,
                    ),
                    filled: false,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
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
                      print("post has been added");
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
