import 'package:flutter/material.dart';
import 'package:ti_boulo/routes.dart';
import 'package:ti_boulo/screens/Intro.dart';
import 'package:ti_boulo/screens/Task.dart';
import 'screens/Profile.dart';
import 'screens/Home.dart';
import 'screens/ViewTask.dart';
import 'screens/Auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ti Boulo',
      theme: ThemeData(
        primaryColor: Colors.white,
        
      ),
      //initialRoute: '/intro',
      initialRoute: '/auth',
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.profile: (context) => ProfileScreen(),
        Routes.task: (context) => TaskScreen(),
        Routes.viewTask: (context) => ViewTaskScreen(),
        Routes.intro: (context) => IntroScreen(),
        Routes.auth: (context) => AuthScreen(),
      },
    );
  }
}
