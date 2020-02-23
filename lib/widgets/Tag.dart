import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String title;
  final Color color;
  Tag({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(3.0),
      decoration:
          BoxDecoration(border: Border.all(color: this.color, width: 1.0)),
      child: Text(
        this.title,
        style: TextStyle(color: this.color, fontSize: 12.0),
      ),
    );
  }
}
