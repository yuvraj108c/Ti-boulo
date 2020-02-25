import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:ti_boulo/constants.dart';
import 'package:ti_boulo/widgets/ImageGrid.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';

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
        title: "Profile",
        actions: <Widget>[IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: sWidth / 9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GFImageOverlay(
                    borderRadius: BorderRadius.circular(75),
                    height: 150,
                    width: 150,
                    image: NetworkImage(imageUrl),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.0),
                    height: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(about, style: kSubtitleStyle),
                        Row(
                          children: <Widget>[
                            Icon(Icons.email, size: 20),
                            Text(" " + email, style: kSubtitleStyle),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            SizedBox(width: 4.0),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ImageGrid(images: images),
              SizedBox(height: 40),
              GFTypography(
                text: 'Experience',
                type: GFTypographyType.typo1,
                showDivider: false,
              ),
              SizedBox(height: 20.0),
              ...generateTilesFromExperience(experience)
            ],
          ),
        ),
      ),
    );
  }
}
