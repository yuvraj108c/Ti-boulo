import 'package:flutter/material.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';

const kMainColor = Color(0xFF6c63ff);
const kMainColor2 = Color(0xFFFFD88D);

final String about = "Wall painter";
final String imageUrl =
    "https://www.easy-profile.com/images/default-avatar.png";
final String name = "John Doe";
final String bio = "I am a very motivated person. I work very hard!";
final List<String> experience = ["Painted wall ", "Constructed buildling"];
final List<String> images = [
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
];

generateTilesFromExperience(List<String> t) {
  var experiences = <Widget>[];
  t.forEach((i) {
    var exp = new GFListTile(
      color: Color(0xFFf7f7f7),
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
