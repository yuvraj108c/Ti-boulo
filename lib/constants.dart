import 'package:flutter/material.dart';

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
  "https://cdn.pixabay.com/photo/2019/12/12/13/42/castle-4690710_960_720.jpg",
  "https://cdn.pixabay.com/photo/2015/07/28/20/55/tools-864983_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/10/04/05/42/workshop-4524838_960_720.jpg",
];

// General Hardcoded Values
const String USERNAME = "John";

// Task
List<Map> ktasks = [
  {
    'id': "0",
    'title': "Cut a tree",
    'description':
        "Nesciunt ab et aliquid ut. Aspernatur et est. Minima ipsum laboriosam ratione dolorum numquam corrupti quisquam quia. Voluptates optio incidunt deserunt et voluptatum voluptatum dolorem dicta. Esse ullam debitis et omnis maxime facere non perspiciatis.",
    'date': "26/01/2021",
    'location': "Reduit",
    'imageUrl': images[0],
    'price': 1200,
    'tags': ["construction", "manual"],
  },
  {
    'id': "1",
    'title': "Build a Castle",
    'description':
        "Dignissimos eos quaerat aut fugiat maxime sit error itaque. Blanditiis nesciunt delectus voluptatibus nemo modi. Tempora sequi sapiente. Nemo dolor quia delectus deleniti a porro expedita. Voluptatem debitis accusamus atque rerum dolorum adipisci.",
    'date': "15/07/2020",
    'location': "Reduit",
    'imageUrl': images[2],
    'price': 1200,
    'tags': ["construction", "manual"],
  },
  {
    'id': "2",
    'title': "Repair Something",
    'description':
        "Est fugiat itaque corrupti quis et non. Quia labore similique impedit facilis et doloremque vel inventore. Eaque fugiat quas error animi eos quisquam sit quo.",
    'date': "01/10/2020",
    'location': "Reduit",
    'imageUrl': images[1],
    'price': 1200,
    'tags': ["construction", "manual"],
  },
  {
    'id': "3",
    'title': "Shop in a Workshop",
    'description':
        "Aut nobis iure deserunt. Sapiente nihil explicabo alias quo. Molestiae molestiae dolorem dignissimos. Consequuntur et sed.",
    'date': "19/11/2020",
    'location': "Reduit",
    'imageUrl': images[3],
    'price': 1200,
    'tags': ["construction", "manual"],
  }
];
