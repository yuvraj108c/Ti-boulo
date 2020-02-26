import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String title;
  final Color color;
  Tag({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFedeaea),
      ),
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(7.0),
      child: Text(
        "#" + this.title,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
