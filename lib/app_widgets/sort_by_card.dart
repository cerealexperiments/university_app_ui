import 'package:flutter/material.dart';

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
    );
  }
}
