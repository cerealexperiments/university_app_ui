import 'package:flutter/material.dart';

import '../app_widgets/section_card.dart';

class SectionPage extends StatelessWidget {
  const SectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Container(
                width: 150,
                height: 40,
                margin: EdgeInsets.only(left: 40, top: 50),
                child: Text(
                  "Категория",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 140, top: 52),
                child: Image.asset(
                  "icons/info.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SectionCard(sectionName: "Кухня", sectionIconPath: "icons/kitchen.png"),
          SectionCard(sectionName: "Уборка", sectionIconPath: "icons/cleaning.png"),
          SectionCard(sectionName: "Сад", sectionIconPath: "icons/gardening-tools.png"),
          SectionCard(sectionName: "Электричество", sectionIconPath: "icons/lamp.png"),
          SectionCard(sectionName: "Ремонт", sectionIconPath: "icons/settings.png"),
        ],
      ),
    );
  }
}
