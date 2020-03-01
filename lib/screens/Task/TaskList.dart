import 'package:flutter/material.dart';
import 'package:ti_boulo/utils/functions.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';

import '../../constants.dart';

/// Task List
///
/// Renders a List of Tasks
/// TODO: Accept List<Task> as parameter
class TaskList extends StatefulWidget {
  TaskList({Key key}) : super(key: key);

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(title: "Home"),
      drawer: MyDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: sWidth / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 3),
                  decoration: BoxDecoration(
                    color: Color(0xFFDCDCDE),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Search',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black26,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                ...generateTaskTiles(ktasks),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
