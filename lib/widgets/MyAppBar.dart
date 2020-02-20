import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, String title})
      : super(key: key, title: Text(title), centerTitle: true, elevation: 0.0);
}
