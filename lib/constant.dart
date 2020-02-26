import 'package:flutter/material.dart';
import 'package:ti_boulo/widgets/Tag.dart';

const kMainColor = Color(0xFF6c63ff);
const kMainBackgroundColor = Color(0xFFE9EAEF);

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
