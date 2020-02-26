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
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(icon: Icons.assignment_ind, text: 'My Profile'),

          Divider(),
          _createDrawerItem(
            icon: Icons.list,
            text: 'My Tasks',
            // onTap: () =>
            //     Navigator.pushReplacementNamed(context, Routes.notes)
          ),
          _createDrawerItem(
            icon: Icons.add,
            text: 'Create Task',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.task)
          ),
          Divider(),
          _createDrawerItem(icon: Icons.face, text: 'Freelancers'),
          Divider(),
          _createDrawerItem(icon: Icons.settings, text: 'Settings'),
          _createDrawerItem(icon: Icons.account_box, text: 'About this App'),
          ListTile(
            title: Text('TiBoulo by Ternary', style: TextStyle(color: Colors.grey),),
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
                fit: BoxFit.fill, image: AssetImage('assets/images/card_bg.jpg'))),
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
