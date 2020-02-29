import 'package:flutter/material.dart';
import 'package:ti_boulo/routes.dart';
import 'package:ti_boulo/screens/EditProfile.dart';
import 'package:ti_boulo/screens/Intro.dart';
import 'package:ti_boulo/screens/CreateTask.dart';
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
      initialRoute: '/home',
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.profile: (context) => ProfileScreen(),
        Routes.editProfile: (context) => EditProfileScreen(),
        Routes.task: (context) => TaskScreen(),
        Routes.viewTask: (context) => ViewTaskScreen(
            task: (ModalRoute.of(context).settings.arguments as Map)["task"]),
        Routes.intro: (context) => IntroScreen(),
      },
    );
  }
}
