import 'package:flutter/material.dart';
import 'package:univercity_app/app_widgets/shadow.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shadow(button: TextField(
      controller: controller,
      autofocus: false,
      focusNode: myFocusNode,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
              myFocusNode.requestFocus();
            },
            icon: Icon(Icons.clear),
          ),
          prefixIcon: Icon(Icons.search),
          hintText: "Поиск",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none),
      // onChanged: searchItem,
    ),
    );
  }
}
