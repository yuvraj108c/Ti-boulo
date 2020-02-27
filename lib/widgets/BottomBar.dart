import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ti_boulo/constants.dart';

const double bottom_bar_height = 48;

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.face, title: 'Freelancers'),
      ],
      initialActiveIndex: 1, //optional, default as 0
      onTap: (int i) => print('click index=$i'),
      backgroundColor: kMainColor,
      color: kMainBackgroundColor,
    );
  }
}
