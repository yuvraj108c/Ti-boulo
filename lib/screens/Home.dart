import 'package:flutter/material.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';
import 'package:ti_boulo/widgets/TaskItem.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.0),
            child: Text("All Projects",
                style: Theme.of(context).textTheme.headline),
          ),

          // TODO: Fetch from server
          // TODO: Loop + display tasks
          TaskItem(
            title: "Wall Painting",
            description:
                "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
            date: "12/12/2020",
            location: "Reduit",
            imageUrl: "https://picsum.photos/250?image=9",
            price: 1200,
            tags: ["Construction", "Manual"],
          ),
        ],
      ),
    );
  }
}
