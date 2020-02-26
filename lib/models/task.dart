import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:intl/intl.dart';

class Task {
  String title;
  String description;
  List<Category> categories = [];
  String locationType = "in-house";
  String locationName;
  DateTime startDate, endDate;
  double lng = 0;
  double lat = 0;

  String stringifyLocation() {
    String loc = "";
    if (locationName != null) loc += locationName + " ";
    loc += "(" + lat.toString() + ", " + lng.toString() + ")";
    return loc;
  }

  String stringifyDate() {
    var formatter = new DateFormat('dd MMMM yyyy');
    String start = formatter.format(startDate);
    if (endDate == null) {
      return "On " + start;
    }
    String end = formatter.format(endDate);
    return "From " + start + "\nto " + end;
  }

  String stringifyCategories() {
    var concatenate = StringBuffer();

    categories.forEach((item) {
      concatenate.write(item.toString());
    });

    return concatenate.toString();
  }

  @override
  String toString() {
    String s = "";
    s += "Title: ${title ?? ""} \n";
    s += "Description: ${description ?? ""} \n";
    s += "Categories: ${stringifyCategories()} \n";
    s += "Date: ${stringifyDate()} \n";
    s += "location: ${stringifyLocation()} \n";
    return s;
  }
}

/// Language Class
class Language extends Taggable {
  final String name;

  final int position;

  /// Creates Language
  Language({
    this.name,
    this.position,
  });

  @override
  List<Object> get props => [name];

  /// Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    "position": $position\n
  }''';
}

// Category Class
class Category extends Taggable {
  final String name;
  int projectCount = 1; // number of projects with this category
  int workerCount = 0; // number of workers  interested in this category

  Category({this.name});

  void increment(Category category) {
    projectCount++;
  }

  static Category getCategory(String name) =>
      Category(name: 'application development');

  static List<Category> getCategories(String query) {
    return <Category>[
      // Category(name: 'application development'),
      // Category(name: 'website development'),
      // Category(name: 'graphic design'),
      Category(name: 'gardening'),
      Category(name: 'cleaning'),
      Category(name: 'repairs'),
      Category(name: 'electric'),
      Category(name: 'plumbing'),
      Category(name: 'babysitting'),
      Category(name: 'crafts'),
      Category(name: 'painting'),
      Category(name: 'cooking'),
    ]
        .where((category) =>
            category.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  List<Object> get props => [name];

  // Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    "workerCount": $workerCount,\n
    "projectCount": $projectCount\n
  }''';

  @override
  String toString() {
    return name;
  }
}
