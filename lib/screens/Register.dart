import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:ti_boulo/utils/Validator.dart';
import '../constants.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  RegisterBody({Key key}) : super(key: key);

  @override
  RegisterBodyState createState() => RegisterBodyState();
}

class RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController password1Controller = new TextEditingController();
  TextEditingController password2Controller = new TextEditingController();
  bool _isHirer = false;

  @override
  Widget build(BuildContext context) {
    final paddingVertical = MediaQuery.of(context).size.width * 0.08;
    final paddingTop = MediaQuery.of(context).size.height * 0.05;
    final sHeight = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData(accentColor: kMainColor, primaryColor: kMainColor),
      child: (SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                paddingVertical, paddingTop, paddingVertical, 0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Create new", style: kAuthTextStyle),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("account", style: kAuthTextStyle),
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
                    SizedBox(height: sHeight * 0.06),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                      validator: (value) {
                        if (Validator.emptyValidator("Username", value) !=
                            null) {
                          return 'Username cannot be empty';
                        }
                        if (Validator.isLessThan(value, 4)) {
                          return 'Username must have at least 4 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: password1Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                      validator: (value) {
                        if (Validator.emptyValidator("Password", value) !=
                            null) {
                          return 'Password cannot be empty';
                        }
                        if (Validator.isLessThan(value, 4)) {
                          return 'Password must be of at least 4 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: password2Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm password",
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                      validator: (value) {
                        if (value != password1Controller.text) {
                          return 'Your passwords don\'t match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Are you a hirer?'),
                        Switch(
                          value: _isHirer,
                          activeColor: kMainColor,
                          onChanged: (v) {
                            setState(() {
                              _isHirer = v;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: sHeight * 0.05),
                    GFButton(
                        onPressed: () {
                          var type = _isHirer == true ? "Hirer" : "Freelancer";
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Signing up as ' + type)));
                          }
                        },
                        color: kMainColor,
                        text: "Sign up!",
                        fullWidthButton: true,
                        size: GFSize.LARGE),
                  ],
                )),
          ),
        ),
      )),
    );
  }
}
