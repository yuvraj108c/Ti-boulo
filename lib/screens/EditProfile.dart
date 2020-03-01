import 'package:flutter/material.dart';
import 'dart:io';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
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
  File _image;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future uploadImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

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
            Stack(
              children: <Widget>[
                GFImageOverlay(
                  borderRadius: BorderRadius.circular(75),
                  height: 125,
                  width: 125,
                  image: _image != null
                      ? FileImage(_image)
                      : NetworkImage(kprofile['imageUrl']),
                ),
                Positioned(
                  top: 90,
                  left: 90,
                  child: GFIconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.file_upload),
                                  title: Text("Upload from device"),
                                  onTap: () {
                                    // Upload from device
                                    Navigator.pop(context);
                                    uploadImage();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text("Take picture"),
                                  onTap: () {
                                    // Take picture
                                    Navigator.pop(context);
                                    getImageFromCamera();
                                  },
                                )
                              ],
                            );
                          });
                    },
                  ),
                )
              ],
            ),

            // Name
            new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.people),
              ),
              controller: nameController,
            ),
            SizedBox(height: 10.0),
            // About
            new TextFormField(
              maxLines: 1,
              decoration: new InputDecoration(
                prefixIcon: Icon(Icons.info),
                labelText: 'About',
              ),
              controller: aboutController,
            ),
            SizedBox(height: 10.0),
            // Email
            new TextFormField(
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              decoration: new InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              controller: emailController,
            ),
            SizedBox(height: 10.0),
            // Phone
            new TextFormField(
              keyboardType: TextInputType.phone,
              maxLines: 1,
              decoration: new InputDecoration(
                prefixIcon: Icon(Icons.phone),
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
                    FocusScope.of(context).unfocus();
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
