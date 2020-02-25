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
      appBar: MyAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: sWidth / 9),
          child: Column(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          about,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GFButton(
                          onPressed: () {},
                          color: GFColors.SUCCESS,
                          text: "Message",
                          textStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.message,
                            size: 17.0,
                          ),
                        )
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
