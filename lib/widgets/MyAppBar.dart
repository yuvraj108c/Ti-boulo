import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, String title, List<Widget> actions})
      : super(
            key: key,
            title: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: actions);
}
