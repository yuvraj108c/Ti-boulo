import 'package:flutter/material.dart';
import 'package:ti_boulo/routes.dart';
import 'package:ti_boulo/screens/OnBoard/Splash.dart';
import 'package:ti_boulo/screens/Profile/EditProfile.dart';
import 'package:ti_boulo/screens/OnBoard/Intro.dart';
import 'package:ti_boulo/screens/Task/CreateTask.dart';
import 'package:ti_boulo/screens/OnBoard/Login.dart';
import 'package:ti_boulo/screens/OnBoard/Register.dart';
import 'package:ti_boulo/screens/OnBoard/Welcome.dart';
import 'package:ti_boulo/screens/Profile/Profile.dart';
import 'package:ti_boulo/screens/Home.dart';
import 'package:ti_boulo/screens/Task/ViewTask.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ti Boulo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: Routes.splash,
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.profile: (context) => ProfileScreen(),
        Routes.editProfile: (context) => EditProfileScreen(),
        Routes.task: (context) => CreateTaskScreen(),
        Routes.viewTask: (context) => ViewTaskScreen(
            task: (ModalRoute.of(context).settings.arguments as Map)["task"]),
        Routes.intro: (context) => IntroScreen(),
        Routes.login: (context) => LoginScreen(),
        Routes.register: (context) => RegisterScreen(),
        Routes.welcome: (context) => WelcomeScreen(),
        Routes.splash: (context) => SplashScreen(),
      },
    );
  }
}
