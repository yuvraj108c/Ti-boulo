import 'package:flutter/material.dart';
import '../constants.dart';

class PriceTag extends StatelessWidget {
  final String price;
  PriceTag({this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        "Rs " + this.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            bottomLeft: const Radius.circular(3.0),
            topRight: const Radius.circular(20.0),
            bottomRight: const Radius.circular(20.0)),
      ),
    );
  }
}
