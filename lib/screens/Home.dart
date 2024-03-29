import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ti_boulo/screens/Profile/Profile.dart';
import 'package:ti_boulo/screens/Task/CreateTask.dart';
import 'package:ti_boulo/screens/Task/TaskList.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';

import '../constants.dart';

/// Home Screen
///
/// Skeleton of the Home Screen. Populate based on user
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<TabItem> items = [
    TabItem(icon: Icons.add, title: 'Add'),
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.face, title: 'Freelancers'),
  ];
  final List<StatefulWidget> pages = [
    CreateTaskScreen(),
    TaskList(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          children: pages.toList(growable: false),
        ),
        bottomNavigationBar: new ConvexAppBar(
            items: items,
            backgroundColor: kMainColor,
            color: kMainBackgroundColor,
            initialActiveIndex: 1),
        backgroundColor: Color(0xFFF2F2F2),
        drawer: MyDrawer(),
      ),
    );
  }

  Container tabContent(TabItem data, Color color) {
    return Container(
        height: kBottomBarHeight,
        padding: EdgeInsets.only(bottom: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(data.icon, color: color),
            Text(data.title, style: TextStyle(color: color))
          ],
        ));
  }
}
