import 'package:flutter/material.dart';

import '../pages/front_page.dart';

class SectionCard extends StatefulWidget {

  SectionCard({required this.sectionName, required this.sectionIconPath});

  late final String sectionName;
  late final String sectionIconPath;

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FrontPage()));
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      child: Container(
        width: 380,
        height: 80,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(widget.sectionIconPath, width: 60, height: 60,),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
              widget.sectionName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset("icons/arrow-right.png", width: 20, height: 20,),
            ),
          ],
        ),
      ),
    );
  }
}
