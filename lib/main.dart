import 'package:flutter/material.dart';
import 'package:ti_boulo/routes.dart';
import 'package:ti_boulo/screens/Location.dart';
import 'package:ti_boulo/screens/Task.dart';
import 'screens/Profile.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components Library',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.profile: (context) => ProfileScreen(),
        Routes.task: (context) => TaskScreen(),
        Routes.location: (context) => LocationScreen(),
      },
    );
  }
}
