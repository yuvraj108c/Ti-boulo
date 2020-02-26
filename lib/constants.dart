import 'package:flutter/material.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:ti_boulo/widgets/Tag.dart';
import 'package:ti_boulo/widgets/TaskItem.dart';

// Colors
const kMainColor = Color(0xFF6c63ff);
const kMainColor2 = Color(0xFFFFD88D);
const kMainBackgroundColor = Color(0xFFE9EAEF);

// Styles
const kSubtitleStyle = TextStyle(
  fontSize: 17,
  color: Colors.black54,
);

// Location API Key
const APIKEY = "AIzaSyAxiXZvMz-x1SEPcvVQntd7Xkzhf80aC74";

generateTagsFromStrings(List<String> t) { // TODO: Move to lib/util
  var tags = <Tag>[];
  t.forEach((i) {
    var tag = new Tag(
      color: kMainColor,
      title: i,
    );
    tags.add(tag);
  });
  return tags;
}


// Profile
final String about = "Wall painter";
final String imageUrl =
    "https://www.easy-profile.com/images/default-avatar.png";
final String name = "John Doe";
final String phone = "51231212";
final String email = "john.doe@gmail.com";
final List<String> experience = ["Painted wall ", "Constructed buildling"];
final List<String> images = [
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
];

// Task
List<Map> ktasks = [
  {
    'title': "Wall Painting",
    'description':
        "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
    'date': "12/12/2020",
    'location': "Reduit",
    'imageUrl':
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    'price': 1200,
    'tags': ["construction", "manual"],
  },
  {
    'title': "Wall Painting",
    'description':
        "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
    'date': "12/12/2020",
    'location': "Reduit",
    'imageUrl':
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    'price': 1200,
    'tags': ["construction", "manual"],
  },
  {
    'title': "Wall Painting",
    'description':
        "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
    'date': "12/12/2020",
    'location': "Reduit",
    'imageUrl':
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    'price': 1200,
    'tags': ["construction", "manual"],
  },
  {
    'title': "Wall Painting",
    'description':
        "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
    'date': "12/12/2020",
    'location': "Reduit",
    'imageUrl':
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    'price': 1200,
    'tags': ["construction", "manual"],
  }
];

// utils
generateTilesFromExperience(List<String> t) {
  var experiences = <Widget>[];
  t.forEach((i) {
    var exp = new GFListTile(
      color: Color(0xFFe5e5e5),
      description: Text(i),
      icon: Icon(Icons.keyboard_arrow_right, size: 30.0),
    );
    experiences.add(exp);
    experiences.add(SizedBox(
      height: 10.0,
    ));
  });
  return experiences;
}

generateTaskTiles(List<Map> t) {
  var tasks = <TaskItem>[];
  t.forEach((i) {
    var task = new TaskItem(
      title: i["title"],
      description: i["description"],
      date: i["date"],
      price: i["price"],
      location: i["location"],
      tags: i["tags"],
    );
    tasks.add(task);
  });
  return tasks;
}
