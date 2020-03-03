import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ti_boulo/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: kMainColor,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Ti Boulo",
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SpinKitFadingFour(
                color: Colors.white,
                size: 50.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
