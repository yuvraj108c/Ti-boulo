import 'package:flutter/material.dart';
import 'package:ti_boulo/constant.dart';

class TaskItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String location;
  final int price;
  final List<String> tags;

  TaskItem(
      {this.title,
      this.description,
      this.imageUrl,
      this.date,
      this.location,
      this.price,
      this.tags});

  @override
  Widget build(BuildContext context) {
    final margin = 15.0;
    final width = MediaQuery.of(context).size.width - 2 * margin;
    final height = 150.0;
    final iSize = 15.0;

    return Card(
      elevation: 15.0,
      margin: EdgeInsets.all(margin),
      child: Row(
        children: <Widget>[
          Container(
            height: height,
            width: width * 1.2 / 4,
            child: Image.network(this.imageUrl, fit: BoxFit.fill),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            height: height,
            width: (width * 2.8) / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.title, style: Theme.of(context).textTheme.title),
                Text(
                  this.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.body1,
                ),
                Row(
                  children: generateTagsFromStrings(this.tags),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: kMainColor,
                          size: iSize,
                        ),
                        Text(" " + this.date),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: kMainColor,
                          size: iSize,
                        ),
                        Text(" " + this.location),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        "Rs " + this.price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(color: kMainColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
