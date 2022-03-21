import "package:flutter/material.dart";

void main() {
  runApp(NewPostPage());
}

class NewPostPage extends StatefulWidget {

  String taskDeadline = "5ч.";

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
            child: Text(
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
                "срок: ${widget.taskDeadline}",
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
          Container(
            margin: EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Новое",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
      ),
    );
  }
}
