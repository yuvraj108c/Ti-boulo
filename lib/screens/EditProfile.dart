import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:ti_boulo/constants.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: "Edit profile",
        ),
        body: EditProfileBody());
  }
}

class EditProfileBody extends StatefulWidget {
  @override
  _EditProfileBodyState createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final nameController = TextEditingController();
    final aboutController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    nameController.text = kprofile['name'];
    aboutController.text = kprofile['about'];
    emailController.text = kprofile['email'];
    phoneController.text = kprofile['phone'];

    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    return Theme(
      data: ThemeData(accentColor: kMainColor, primaryColor: kMainColor),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: sWidth / 14),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // Name
            new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                labelText: 'Name',
              ),
              controller: nameController,
            ),
            SizedBox(height: 10.0),
            // About
            new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                labelText: 'About',
              ),
              controller: aboutController,
            ),
            SizedBox(height: 10.0),
            // Email
            new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
              controller: emailController,
            ),
            SizedBox(height: 10.0),
            // Phone
            new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                labelText: 'Phone',
              ),
              controller: phoneController,
            ),
            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                GFButton(
                  text: "Save",
                  color: kMainColor,
                  onPressed: () {
                    showSnackBarMessage("Profile updated successfully");
                  },
                ),
                SizedBox(width: 20.0),
                GFButton(
                  text: "Cancel",
                  color: GFColors.DARK,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
