import 'package:flutter/material.dart';
import 'screens/Profile.dart';
import 'screens/Home.dart';
import 'screens/ViewTask.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ti Boulo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/viewTask',
      routes: {
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/viewTask': (context) => ViewTaskScreen(),
      },
    );
  }
}
