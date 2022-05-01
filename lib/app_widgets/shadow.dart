import 'package:flutter/material.dart';

class Shadow extends StatelessWidget {


  final Widget button;

  Shadow({ required this.button});
///Принимает button: (child:)///

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          Radius.circular(15),
        ),
      ),
      child: button,
    );
  }
}
