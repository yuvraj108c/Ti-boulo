import 'package:flutter/material.dart';
import 'package:ti_boulo/constants.dart';
import 'package:ti_boulo/widgets/PriceTag.dart';

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
    final height = 150.0;
    final iSize = 15.0;

    return Card(
      margin: EdgeInsets.only(bottom: 20.0),
      elevation: 1.5,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            height: height,
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
                    PriceTag(
                      price: price.toString(),
                    ),
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
