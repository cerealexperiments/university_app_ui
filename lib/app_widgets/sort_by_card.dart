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