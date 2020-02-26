import 'package:flutter/material.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/typography/gf_typography.dart';
import 'package:getflutter/getflutter.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';
import '../constants.dart';

class ViewTaskScreen extends StatefulWidget {
  ViewTaskScreen({Key key}) : super(key: key);

  @override
  _ViewTaskScreenState createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  final Map task = ktasks[0];
  final iSize = 15.0;

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(
        title: "Task details",
      ),
      drawer: MyDrawer(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: sWidth / 9),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: GFImageOverlay(
                  height: sHeight * 2 / 4,
                  width: sWidth,
                  image: NetworkImage(task["imageUrl"]),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  GFTypography(
                    text: task["title"],
                    type: GFTypographyType.typo1,
                    showDivider: false,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: kMainColor,
                            size: iSize,
                          ),
                          Text(" " + task['location']),
                        ],
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: kMainColor,
                            size: iSize,
                          ),
                          Text(" " + task['date']),
                        ],
                      ),
                    ],
                  ),
                  GFTypography(
                    text: task["description"],
                    type: GFTypographyType.typo4,
                    showDivider: false,
                  ),
                  Row(
                    children: generateTagsFromStrings(task['tags']),
                  ),
                  ButtonTheme(
                    padding: EdgeInsets.all(15.0),
                    minWidth: double.infinity,
                    buttonColor: kMainColor,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      onPressed: () {},
                      child:
                          Text("Apply", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
