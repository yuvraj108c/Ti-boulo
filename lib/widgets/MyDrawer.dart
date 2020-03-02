import 'package:flutter/material.dart';

import '../routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, Routes.home);
              }),
          _createDrawerItem(
              icon: Icons.edit,
              text: 'My Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.profile);
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.add,
              text: 'Create Task',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.task);
              }),
          _createDrawerItem(
            // Tasks created by the current user
            icon: Icons.list,
            text: 'My Tasks',
            // onTap: () =>
            //     Navigator.pushReplacementNamed(context, Routes.notes)
          ),
          Divider(),
          _createDrawerItem(
              icon: Icons.verified_user,
              text: 'Login / Register',
              onTap: () {
                Navigator.pushNamed(
                    context, Routes.welcome); // Introduction Screen
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.face, text: 'Freelancers'), // List of freelancers
          _createDrawerItem(
              icon: Icons.chat,
              text: 'Chat',
              onTap: () {
                Navigator.pushNamed(
                    context, Routes.chat); // Introduction Screen
              }), // List of chats
          Divider(),
          _createDrawerItem(
              icon: Icons.stars,
              text: 'Intro',
              onTap: () {
                Navigator.pushNamed(
                    context, Routes.intro); // Introduction Screen
              }),
          _createDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
          ), // App Settings
          Divider(),
          ListTile(
            title: Text(
              'TiBoulo by Ternary',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/card_bg.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("TiBoulo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
