import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ti_boulo/models/User.dart';

import '../../constants.dart';
import '../../routes.dart';

/// Login user
void loginUser(BuildContext ctx, String email, String password) async {
  // TODO: Show loading displays when submit, on error and on success
  Dio dio = new Dio();
  try {
    Response loginResponse = await dio.post("$kURL/users.php", data: {
      "action": "login",
      "email": email,
      "password": password,
    });
    var dec = json.decode(loginResponse.data);
    int status = dec["statuscode"];
    // print("status: $status");
    if (status == 1) {
      var u = json.decode(dec["response"])["user"];
      print("$email: ${u["type"]}");
      saveLoggedIn(email, u["type"])
          .then((_) => Navigator.pushNamed(ctx, Routes.home));
    } else {
      showErrorSnackbar(ctx);
    }
  } catch (e) {
    print(e);
    showErrorSnackbar(ctx);
  }
}

/// Utility function to show snackbar when unable to login
void showErrorSnackbar(ctx) => Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text("Failed to Login. Check your credentials or Signup."),
        duration: const Duration(seconds: 2),
      ),
    );

/// Utility function to check if user is logged in
Future<void> checkLoggedIn(context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool loggedIn = sharedPreferences.getBool("isLoggedIn") ?? false;
  Navigator.pushReplacementNamed(context, loggedIn ? Routes.home : Routes.intro) ;
}
/// Utility function to log out user
Future<void> logOut(context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();  
  sharedPreferences.setBool("isLoggedIn", false);
  Navigator.pushReplacementNamed(context, Routes.intro) ;
}

/// Save user details when logging in
Future<void> saveLoggedIn(String username, String usertype) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool("isLoggedIn", true);
  sharedPreferences.setString("username", username);
  sharedPreferences.setString("usertype", usertype);
  return;
}

/// Register a new user
void registerUser(BuildContext ctx, User user) async {
  Dio dio = new Dio();
  try {
    Response loginResponse = await dio.post("$kURL/users.php", data: {
      "action": "register",
      "email": user.email,
      "password": user.password,
      "first_name": user.firstname,
      "last_name": user.lastname,
      "type": user.type,
      "phone": user.phone,
      "categories": user.categories,
    });

    int status = json.decode(loginResponse.data)["statuscode"];
    print("status: $status");
    // if (status == 1) {
    //   Navigator.pushNamed(ctx, Routes.home);
    // } else {
    //   Scaffold.of(ctx).showSnackBar(
    //     SnackBar(
    //       content: Text("Failed to Login. Check your credentials or Signup."),
    //     ),
    //   );
    // }
  } catch (e) {
    print(e);
  }
}
