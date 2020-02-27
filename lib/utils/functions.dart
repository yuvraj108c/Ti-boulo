import 'package:flutter/material.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:ti_boulo/widgets/Tag.dart';
import 'package:ti_boulo/widgets/TaskItem.dart';
import '../constants.dart';

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
      id: i["id"],
      title: i["title"],
      description: i["description"],
      date: i["date"],
      price: i["price"],
      location: i["location"],
      tags: i["tags"],
      imageUrl: i["imageUrl"],
    );
    tasks.add(task);
  });
  return tasks;
}

generateTagsFromStrings(List<String> t) {
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
