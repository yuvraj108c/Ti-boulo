import 'package:flutter/material.dart';
import 'package:ti_boulo/utils/functions.dart';
import 'package:ti_boulo/widgets/BottomBar.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';
import 'package:ti_boulo/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
      ),
      bottomNavigationBar: BottomBar(),
      backgroundColor: Color(0xFFF2F2F2),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: sWidth / 20),
          height: sHeight * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
