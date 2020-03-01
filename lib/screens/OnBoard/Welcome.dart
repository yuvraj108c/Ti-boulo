import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:ti_boulo/constants.dart';
import '../../routes.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final paddingVertical = MediaQuery.of(context).size.width * 0.06;
    final paddingTop = MediaQuery.of(context).size.height * 0.15;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(
            paddingVertical, paddingTop, paddingVertical, 0),
        child: Column(children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Welcome to ',
                style: kAuthTextStyle,
              ),
              TyperAnimatedTextKit(
                  text: [
                    "Ti boulo",
                  ],
                  isRepeatingAnimation: true,
                  speed: Duration(milliseconds: 200),
                  pause: Duration(seconds: 2),
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    color: kMainColor,
                  ),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Image(
            image: AssetImage('assets/images/welcome.png'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          GFButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              color: kMainColor,
              text: "Sign in",
              fullWidthButton: true,
              size: GFSize.LARGE),
          GFButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
              color: kMainColor,
              text: "Sign up",
              fullWidthButton: true,
              type: GFButtonType.outline,
              size: GFSize.LARGE),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
