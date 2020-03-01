import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:ti_boulo/utils/Validator.dart';

import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  LoginBody({Key key}) : super(key: key);

  @override
  LoginBodyState createState() => LoginBodyState();
}

class LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paddingVertical = MediaQuery.of(context).size.width * 0.08;
    final paddingTop = MediaQuery.of(context).size.height * 0.05;
    final sHeight = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData(accentColor: kMainColor, primaryColor: kMainColor),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              paddingVertical, paddingTop, paddingVertical, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Welcome", style: kAuthTextStyle),
                SizedBox(
                  height: 10.0,
                ),
                Text("back!", style: kAuthTextStyle),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 5.0,
                    width: 20.0,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black38),
                  ),
                  validator: (value) =>
                      Validator.emptyValidator("Username", value),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black38),
                      labelText: "Password"),
                  validator: (value) =>
                      Validator.emptyValidator("Password", value),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                GFButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Logging in')));
                      }
                    },
                    color: kMainColor,
                    text: "Sign in!",
                    fullWidthButton: true,
                    size: GFSize.LARGE),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
