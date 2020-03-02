import 'package:flutter/material.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/typography/gf_typography.dart';
import 'package:getflutter/getflutter.dart';
import 'package:ti_boulo/utils/functions.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import '../../constants.dart';
import 'PriceTag.dart';
import 'TaskItem.dart';

/// View A Single task
///
/// takes a Task as parameter
class ViewTaskScreen extends StatefulWidget {
  final TaskItem task;
  ViewTaskScreen({Key key, this.task}) : super(key: key);

  @override
  _ViewTaskScreenState createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  final iSize = 15.0;
  TaskItem task;

  @override
  void initState() {
    task = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(
        title: "Task details",
      ),
      body: SingleChildScrollView(
        child: Container(
          height: sHeight,
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: sWidth / 14),
          child: Column(
            children: <Widget>[
              Container(
                height: sHeight * 1 / 3,
                child: GFImageOverlay(
                    image: NetworkImage(task.imageUrl),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Container(
                height: sHeight * 1.5 / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    GFTypography(
                      text: task.title,
                      type: GFTypographyType.typo1,
                      showDivider: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: kMainColor,
                              size: iSize,
                            ),
                            Text(" " + task.location),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: kMainColor,
                              size: iSize,
                            ),
                            Text(" " + task.date),
                          ],
                        ),
                        PriceTag(
                          price: task.price.toString(),
                        )
                      ],
                    ),
                    GFTypography(
                      text: task.description,
                      type: GFTypographyType.typo4,
                      showDivider: false,
                    ),
                    Row(
                      children: generateTagsFromStrings(task.tags),
                    ),
                    GFButton(
                        onPressed: () {},
                        color: kMainColor,
                        text: "Apply",
                        fullWidthButton: true,
                        size: GFSize.LARGE),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
