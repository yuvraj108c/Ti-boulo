import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:ti_boulo/constants.dart';
import 'package:ti_boulo/utils/functions.dart';
import 'package:ti_boulo/widgets/ImageGrid.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';

import '../../routes.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: USERNAME,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, Routes.editProfile);
              })
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: sWidth / 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GFImageOverlay(
                    borderRadius: BorderRadius.circular(75),
                    height: 125,
                    width: 125,
                    image: NetworkImage(kprofile['imageUrl']),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          kprofile['name'],
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(kprofile['about'], style: kSubtitleStyle),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    text: "Chat",
                    color: GFColors.SUCCESS,
                    icon: Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                  GFButton(
                    onPressed: () {},
                    text: "Mail",
                    color: GFColors.SECONDARY,
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                  GFButton(
                    onPressed: () {},
                    text: "Call",
                    color: GFColors.PRIMARY,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ImageGrid(images: kprofile['images']),
              SizedBox(height: 30),
              GFTypography(
                text: 'Experience',
                type: GFTypographyType.typo1,
                showDivider: false,
              ),
              SizedBox(height: 20.0),
              ...generateTilesFromExperience(kprofile['experience'])
            ],
          ),
        ),
      ),
    );
  }
}
