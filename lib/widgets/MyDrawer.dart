import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
          child: Text('Ti Boulo'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        ListTile(
          title: Text('Profile'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/profile');
          },
        ),
      ]),
    );
  }
}
