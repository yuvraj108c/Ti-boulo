import 'package:flutter/material.dart';
import 'package:ti_boulo/screens/chat/Chat.dart';
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
      initialRoute: '/chat',
      routes: {
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => ChatAppScreen(),
      },
    );
  }
}
