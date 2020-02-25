import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, String title})
      : super(
            key: key,
            title: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white);
}
